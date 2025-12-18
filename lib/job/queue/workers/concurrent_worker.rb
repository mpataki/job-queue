require 'concurrent-ruby'

module Job::Queue::Workers
  class ConcurrentWorker < Worker
    def initialize(queue, error_handler = Job::Queue::ErrorHandling::NoOpErrorHandler, thread_count = 5)
      super(queue, error_handler)
      @pool = Concurrent::FixedThreadPool.new(thread_count)
    end

    def run
      Thread.new do
        loop do
          job = @queue.dequeue

          if job.nil?
            sleep 5
          else
            @pool.post do
              @error_handler.wrap do
                job&.run
              end
            rescue StandardError
              puts 'job error bubbled up to worker, failing job'
            end
          end
        end
      end
    end

    def shutdown
      @pool.shutdown
    end
  end
end

require 'concurrent-ruby'

module Job::Queue::Workers
  class ConcurrentWorker < Worker
    def initialize(queue, thread_count: 5)
      super(queue)
      @pool = Concurrent::FixedThreadPool.new(thread_count)
    end

    def run
      @pool.post do
        loop do
          job = @queue.dequeue

          if job.nil?
            sleep 5
          else
            @pool.post do
              job&.run
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

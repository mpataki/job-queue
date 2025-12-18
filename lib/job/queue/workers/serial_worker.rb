module Job::Queue::Workers
  class SerialWorker < Worker
    def run
      loop do
        job = @queue.dequeue

        @error_handler.wrap do
          job&.run
        end

        sleep 5 if job.nil?
      end
    end
  end
end

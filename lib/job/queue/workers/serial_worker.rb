module Job::Queue::Workers
  class SerialWorker < Worker
    def run
      loop do
        job = @queue.dequeue

        job&.run

        sleep 5 if job.nil?
      end
    end
  end
end

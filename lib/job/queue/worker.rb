module Job::Queue
  class Worker
    def initialize(queue)
      @queue = queue
    end

    def run
      loop do
        job = @queue.dequeue

        job&.run

        sleep 5 unless job
      end
    end
  end
end

module Job::Queue::Workers
  class Worker
    def initialize(queue)
      @queue = queue
    end

    def run
      raise NotImplementedError
    end
  end
end

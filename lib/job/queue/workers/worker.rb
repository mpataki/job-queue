module Job::Queue::Workers
  class Worker
    def initialize(queue, error_handler = Job::Queue::ErrorHandling::NoOpErrorHandler)
      @queue = queue
      @error_handler = error_handler
    end

    def run
      raise NotImplementedError
    end
  end
end

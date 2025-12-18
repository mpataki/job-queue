module Job::Queue::ErrorHandling
  class ErrorHandler
    def wrap
      raise NotImplementedError
    end
  end
end

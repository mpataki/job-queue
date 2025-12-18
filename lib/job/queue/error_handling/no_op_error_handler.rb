module Job::Queue::ErrorHandling
  class NoOpErrorHandler < ErrorHandler
    def wrap
      yield
    end
  end
end

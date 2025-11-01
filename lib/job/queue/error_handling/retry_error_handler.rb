module Job::Queue::ErrorHandling
  class RetryErrorHandler < ErrorHandler
    def initialize(max_reties = 3)
      @max_reties = max_reties
    end

    def wrap
      tries = 0

      begin
        yield
      rescue StandardError => e
        tries += 1

        retry if tries < @max_reties

        raise
      end
    end
  end
end

module Job::Queue
  module Job
    attr_reader :args

    def initialize(args)
      @args = args
    end

    def run
      throw NotImplementedError.new
    end
  end
end

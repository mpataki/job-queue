require 'redis'
require 'json'

module Job::Queue
  class Queue
    def initialize(reference, redis)
      @reference = reference
      @redis = redis
    end

    def enqueue(job)
      job_definition = {
        class_name: job.class.name,
        args: job.args
      }

      @redis.lpush(redis_key, JSON.generate(job_definition))
    end

    def dequeue
      raw_value = @redis.rpop(redis_key)

      return nil unless raw_value

      job_definition = JSON.parse(raw_value, symbolize_names: true)

      puts job_definition

      klass = Object.const_get(job_definition[:class_name])

      puts klass

      klass.new(job_definition[:args])
    end

    private

    def redis_key
      "jq:#{@reference}"
    end
  end
end

require 'job/queue/version'
require 'job/queue/job'
require 'job/queue/queue'
require 'job/queue/worker'

module Job
  module Queue
    class Error < StandardError; end
  end
end

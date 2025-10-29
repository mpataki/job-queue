# Build a Redis-backed job queue with retry logic

Implement a simple background job system using Redis - like a tiny Sidekiq/Resque.

## The challenge
30-minute version:

Enqueue jobs (class name + arguments) to Redis list
Worker polls queue and executes jobs
Jobs are Ruby classes with a perform method

## 60-minute version:
Add:
- Retry failed jobs (with exponential backoff)
- Job status tracking (pending/processing/completed/failed)
- Multiple queues with priority
- Stats: jobs processed, failed, pending count

## 90-minute version:
Add:
- Scheduled jobs (run at specific time)
- Job TTL/expiration
- Dead letter queue (jobs that failed too many times)
- Worker graceful shutdown
- RSpec tests

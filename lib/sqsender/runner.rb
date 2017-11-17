require 'sqsender'

module Sqsender
  class Runner

    attr_reader :filename

    def initialize(filename)
      @filename = filename
    end

    def run
      timestamp = Time.current.strftime('%Y-%m-%dT%H:%M:%SZ')
      sqs_message = "{\"timestamp\" => \"#{timestamp}\", \"payload\" => \"#{upload_file}\"}"
      response = sqs_queue.send_message({queue_url: queue_url, message_body: sqs_message})
      puts response
      puts sqs_message
    end

    def upload_file
      return @upload_file if defined?(@upload_file)

      puts "upload #{filename}"

      local_path = File.expand_path('../../upload', __dir__)
      local_file = File.join(local_path, filename)

      timestamp = Time.current.strftime('%Y%m%dT%H%M%SZ')
      remote_path = File.join("bbcw_nls", "zeus", timestamp, filename)

      obj = bucket.object(remote_path)
      obj.upload_file(local_file)
      @upload_file = obj.public_url.to_s
    end
  end
end

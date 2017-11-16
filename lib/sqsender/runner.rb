require 'sqsender'

module Sqsender
  class Runner

    attr_reader :filename

    def initialize(filename)
      @filename = filename
    end

    def run
      sqs_message = {"id" => 5_184_843, "timestamp" => "2013-04-23T16:05:58Z", "payload" => upload_file }
      response = sqs_queue.send_message({queue_url: queue_url, message_body: sqs_message.inspect})
      puts response
      puts sqs_message.inspect
    end

    def upload_file
      return @upload_file if defined?(@upload_file)

      puts "upload #{filename}"

      local_path = File.expand_path('../../upload', __dir__)
      local_file = File.join(local_path, filename)

      timestamp = Time.current.iso8601.gsub(/[^0-9a-z ]/i, "")
      remote_path = File.join("bbcw_nls", "zeus", timestamp, filename)

      obj = bucket.object(remote_path)
      obj.upload_file(local_file)
      @upload_file = obj.public_url.to_s
    end
  end
end

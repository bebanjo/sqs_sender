require 'aws-sdk'

def aws_client
  @aws_client ||= Aws::S3::Client.new(region: Sqsender.config.options['region'],
                                       credentials: Aws::Credentials.new(
                                         Sqsender.config.options['access_key_id'],
                                         Sqsender.config.options['secret_access_key']))
end

def aws_resource
  @aws_resource ||= Aws::S3::Resource.new(client: aws_client)
end

def bucket
  aws_resource.bucket(Sqsender.config.options['bucket'])
end

#def upload_file(filename)
#  puts "upload #{filename}"
#
#  local_path = File.expand_path('../../upload', __dir__)
#  local_file = File.join(local_path, filename)
#
#  timestamp = Time.current.iso8601.gsub(/[^0-9a-z ]/i, "")
#  remote_path = File.join("bbcw_nls", "zeus", timestamp, filename)
#
#  obj = bucket.object(remote_path)
#  obj.upload_file(local_file)
#  obj.public_url.to_s
#end

# SQS

def sqs_queue
  @sqs_queue ||= Aws::SQS::Client.new(region: Sqsender.config.options['region'],
                                       credentials: Aws::Credentials.new(
                                         Sqsender.config.options['access_key_id'],
                                         Sqsender.config.options['secret_access_key']))
end

def queue_url
  @queue_url ||= "#{Sqsender.config.options['queue_url']}#{Sqsender.config.options['queue_name']}"
end


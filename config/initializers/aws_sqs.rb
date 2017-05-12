require 'aws-sdk-v1'

MYSQS = AWS::SQS.new(
  Sqsender.config.options['access_key_id'],
  Sqsender.config.options['secret_access_key'])

Shoryuken.configure_client do |config|
  config.aws = {
    sqs_endpoint:      ENV["AWS_SQS_ENDPOINT"],
    region:            ENV["AWS_REGION"],
    access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    verify_checksums:  Rails.env.production?
  }
end

Shoryuken.configure_server do |config|
  Rails.logger = Shoryuken::Logging.logger
  Rails.logger.level = Logger::INFO
end

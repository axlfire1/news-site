CarrierWave.configure do |config|
  # Use local file storage for development and test environments
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      region: 'us-east-1',
      aws_access_key_id: Rails.application.credentials.aws.access_key_id,
      aws_secret_access_key: Rails.application.credentials.aws.secret_access_key
    }
    config.fog_directory = 'news-site-announcements'
  end

  config.cache_storage = :file
  config.cache_dir = "#{Rails.root}/tmp/uploads"
end

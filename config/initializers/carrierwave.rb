CarrierWave.configure do |config|

# require 'dotenv-rails'
# Dotenv.load

  if Rails.env.development? or Rails.env.test?
    config.storage = :file
    config.asset_host = "http://localhost:3000"
  else
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region: ENV['AWS_REGION']
    }
    config.storage = :fog
    config.fog_public = false
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    config.fog_directory  = ENV['S3_BUCKET_NAME']
    config.asset_host = ENV['AWS_S3_URL']
  end

end


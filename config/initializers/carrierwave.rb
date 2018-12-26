CarrierWave.configure do |config|

  # if Rails.env.development? or Rails.env.test?
    # config.storage = :file
    # config.asset_host = "http://localhost:3000"
  # else
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['SECRET_ACCESS_KEY'],
      :region                 => 'ap-northeast-1'
    }
    config.storage = :fog
    config.fog_directory  = ENV['S3_BUCKET_NAME']
    config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"
  # end

end


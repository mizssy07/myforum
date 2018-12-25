CarrierWave.configure do |config|

  if Rails.env.development? or Rails.env.test?
    config.storage = :file
    config.asset_host = "http://localhost:3000"
  else
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['SECRET_ACCESS_KEY'],
      :region                 => 'ap-northeast-1'
    }
    config.storage = :fog
    config.fog_public = true
    config.fog_directory  = 'rails-picture-181225'
    config.cache_dir =  :fog
    config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/rails-picture-181225'
  end

end


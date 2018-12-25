CarrierWave.configure do |config|

  if Rails.env.development? or Rails.env.test?
    config.storage = :file
    config.asset_host = "http://localhost:3000"
  else
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAIWGCKFJBTUFQLBCQ',
      :aws_secret_access_key  => '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'
    }
    config.fog_directory  = 'rails-picture-181225'
    config.cache_dir =  :fog
    config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/rails-picture-181225'
  end

end
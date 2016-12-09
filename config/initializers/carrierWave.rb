CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV["S3_ACCESS_KEY_ID"],
      :aws_secret_access_key  => ENV['S3_SECRET_ACCESS_KEY'],
      :region                 => ENV["S3_REGION"],
      :path_style             => true,
  }

  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = ENV["S3_BUCKET_NAME"]
      config.asset_host = ENV["S3_ASSET_HOST"]
    when 'staging'
      config.fog_directory = ENV["S3_BUCKET_NAME"]
      config.asset_host = ENV["S3_ASSET_HOST"]
    when 'development'
      config.asset_host = ENV["S3_ASSET_HOST"]
    when 'test'
      config.fog_directory = ENV["S3_BUCKET_NAME"]
      config.asset_host = ENV["S3_ASSET_HOST"]
  end
end

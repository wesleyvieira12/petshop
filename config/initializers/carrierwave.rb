if Rails.env.test? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.root = "#{Rails.root}/tmp"
    config.cache_dir = "#{Rails.root}/tmp/images"
  end
end
# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  storage :fog
  # Other configurations go here
end

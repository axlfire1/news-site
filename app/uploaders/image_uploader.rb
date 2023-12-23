# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  version :thumb do
    process resize_to_fit: [145, 100]
  end
end

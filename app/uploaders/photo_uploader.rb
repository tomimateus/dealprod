# encoding: utf-8
class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog
  process :convert => 'jpg'

  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  version :social_icon do
    process :resize_to_fill => [40, 40]
  end

  version :carrousel_small do
    process :resize_to_fill => [120, 48]
  end

  version :carrousel_offer do
    process :resize_to_fill => [166, 76]
  end

  version :confirmation do
    process :resize_to_fill => [110, 90]
  end

  version :big do
    process :resize_to_fill => [620, 325]
  end

  version :small do
    process :resize_to_fill => [300, 138]
  end

  version :list do
    process :resize_to_fill => [110, 90]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end

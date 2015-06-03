# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :scale => [50, 50]
    process :resize_to_limit => [80, 50]
  end

  version :circle do
    process :scale => [30, 30]
  end

  def scale(width, height)
    # do something
  end

  def extension_white_list
    %w(pdf doc docx jpg jpeg gif png)
  end

end

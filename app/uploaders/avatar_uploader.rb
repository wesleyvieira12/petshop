class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
   include CarrierWave::RMagick
   #include CarrierWave::MiniMagick

  storage :file
 
  # Local onde será guardado as imagens
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
  ## Tamanhos que o CarrierWave vai salvar as imagens
 
  # Thumb
  version :thumb do
     process resize_to_fit: [50, 50]
  end
 
  # Medium
  version :min do
     process resize_to_fit: [40, 40]
  end
 
  # Big
  version :big do
     process resize_to_fit: [300, 300]
  end
 
  # Tipos de extensão aceitas
  def extension_whitelist
     %w(jpg jpeg gif png)
  end


end

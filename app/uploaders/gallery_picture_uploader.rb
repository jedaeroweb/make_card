class GalleryPictureUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  #include CarrierWave::MiniMagick

  storage :file
  process convert: "jpg"


  # Override the directory where uploaded uploads will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    return "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def size_range
    1.byte..5.megabytes
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process uploads as they are uploaded:
  # process :scale => [200, 300]
  #
  def scale(width, height)
    # do something
  end

  # Create different versions of your uploaded uploads:
  version :tiny_thumb do
    process resize_to_fill: [50, 50]
  end

  # Create different versions of your uploaded uploads:
  version :small_thumb do
    process resize_to_fill: [150, 150]
  end

  version :medium_thumb do
    process resize_to_fill: [300, 300]
  end

  version :large_thumb do
    process resize_to_fill: [800, 600]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w[jpg jpeg png gif webp heic heif]
  end

  def filename
    @safe_filename ||= begin
                         source_name =
                           original_filename.presence ||
                           file&.filename.presence ||
                           "file.jpg"

                         ext  = File.extname(source_name)
                         base = File.basename(source_name, ext)

                         normalized =
                           base
                             .unicode_normalize(:nfkd)
                             .encode("ASCII", replace: "", undef: :replace)
                             .gsub(/[^a-zA-Z0-9_-]/, "_")
                             .gsub(/_+/, "_")
                             .gsub(/\A_+|_+\z/, "")
                             .downcase

                         normalized = "file" if normalized.blank?
                         ext = ".jpg" if ext.blank?

                         if Rails.env.production?
                           "#{normalized}_#{secure_token}#{ext.downcase}"
                         else
                           "#{base}#{ext}" # 로컬은 한글 그대로
                         end
                       end
  end

  protected

  def secure_token
    model.instance_variable_get(:"@#{mounted_as}_secure_token") ||
      model.instance_variable_set(:"@#{mounted_as}_secure_token", SecureRandom.hex(10))
  end
end

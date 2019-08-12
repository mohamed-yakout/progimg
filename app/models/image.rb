class Image < ApplicationRecord
  has_attached_file :img
  # Validate content type
  validates_attachment_content_type :img, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :img, matches: [/png\z/, /jpe?g\z/, /bmp\z/, /tiff\z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :img
end

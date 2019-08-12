require 'mini_magick'
require 'open-uri'

class Image < ApplicationRecord
  has_attached_file :img, storage: :s3, path: "/progimg/:filename"
  # Validate content type
  # validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
  # Validate filename
  # validates_attachment_file_name :img, matches: [/png\z/, /jpe?g\z/, /bmp\z/, /tiff\z/]
  # Explicitly do not validate
  # do_not_validate_attachment_file_type :img

  validates_attachment_content_type :img, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  before_save :set_image


  #   https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500

  def set_image
    # minimagic_img = MiniMagick::Image.open(self.remote_url)
    # self.img = minimagic_img.to_blob
    # self.save!

    # self.img = open(self.remote_url)
    # self.save!

    # self.img = URI.parse(self.remote_url)
    # self.save!

    self.img = URI.parse(self.remote_url).open

    # self.img = Paperclip.io_adapters.for(URI.parse(self.remote_url).to_s, { hash_digest: Digest::MD5 })
    # self.save!
  end
end

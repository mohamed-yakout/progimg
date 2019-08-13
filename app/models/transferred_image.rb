require 'mini_magick'
require 'open-uri'

class TransferredImage < ApplicationRecord
  belongs_to :image

  validates_format_of :resize, with: /[0-9](?:x|X)[0-9]/, allow_blank: true
  validates_format_of :format, with: /(?:jpg|jpeg|gif|png)/, case_sensitive: false, allow_blank: true
  validates_format_of :rotate, with: /[0-9]+/, allow_blank: true

  has_attached_file :img, storage: :s3, path: "/tranferred_progimg/:filename"

  validates_attachment_content_type :img, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  before_validation :set_image

  def img_url
    self.img(:origin)
  end

  def set_image
    minimagic_img = MiniMagick::Image.open(self.image.img_url)
    minimagic_img.resize self.resize if self.resize
    minimagic_img.format self.format if self.format
    minimagic_img.rotate self.rotate if self.rotate
    minimagic_img.colorspace self.colorspace if self.colorspace
    self.img = File.open(minimagic_img.path)
  end
end

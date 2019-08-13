require 'mini_magick'
require 'open-uri'

class TransferredImage < ApplicationRecord
  belongs_to :image

  has_attached_file :img, storage: :s3, path: "/tranferred_progimg/:filename"

  validates_attachment_content_type :img, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  before_save :set_image

  def set_image
    minimagic_img = MiniMagick::Image.open(self.image.img_url)
    minimagic_img.resize self.resize
    minimagic_img.format self.format
    minimagic_img.rotate self.rotate
    minimagic_img.colorspace self.colorspace
    self.img = File.open(minimagic_img.path)
  end
end

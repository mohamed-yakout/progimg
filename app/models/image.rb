require 'open-uri'

class Image < ApplicationRecord
  has_many :transferred_images, dependent: :destroy

  has_attached_file :img, storage: :s3, path: "/progimg/:filename"

  validates_attachment_content_type :img, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def img_url
    self.img(:origin)
  end

  before_validation :set_image

  def set_image
    self.img = URI.parse(self.remote_url).open
  end
end

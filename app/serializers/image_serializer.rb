class ImageSerializer < ActiveModel::Serializer
  attributes :id, :remote_url, :img_url

  has_many :transferred_images
end
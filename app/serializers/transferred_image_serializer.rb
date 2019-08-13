class TransferredImageSerializer < ActiveModel::Serializer
  attributes :id, :img_url, :resize, :rotate, :format, :colorspace
end
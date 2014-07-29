class ImageSerializer < ActiveModel::Serializer
  attributes :id, :caption
  has_many :categories
end

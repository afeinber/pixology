class ImageSerializer < ActiveModel::Serializer
  attributes :id, :thumb_url, :square_url, :medium_url

  has_one :user

  def thumb_url
    object.sharedimg.url(:thumb)
  end

  def square_url
    object.sharedimg.url(:square)
  end

  def medium_url
    object.sharedimg.url(:medium)
  end
end

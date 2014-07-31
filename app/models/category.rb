class Category < ActiveRecord::Base
  has_many :images, through: :categorized_images
  has_many :categorized_images

  validates :description, presence: true
  validates :description, uniqueness: true

  def accordion_five
    self.images.order(created_at: :desc).limit(5)
  end
end

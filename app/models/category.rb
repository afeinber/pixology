class Category < ActiveRecord::Base
  has_many :images, through: :categorized_images
  has_many :categorized_images

  validates :description, presence: true
  validates :description, uniqueness: true
end

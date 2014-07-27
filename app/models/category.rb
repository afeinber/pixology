class Category < ActiveRecord::Base
  has_many :images, through: :categorized_images
end

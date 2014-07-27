class CategorizedImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :category

  validates! :image_id, uniqueness: { scope: :category_id }
end

class AddIndicesForFavoritesAndCategorizedImages < ActiveRecord::Migration
  def change
    add_index :categorized_images, :category_id
    add_index :categorized_images, :image_id
    add_index :favorites, :user_id
    add_index :favorites, :image_id
  end
end

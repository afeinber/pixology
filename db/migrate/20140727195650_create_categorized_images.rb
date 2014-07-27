class CreateCategorizedImages < ActiveRecord::Migration
  def change
    create_table :categorized_images do |t|
      t.references :category
      t.references :image
    end
  end
end

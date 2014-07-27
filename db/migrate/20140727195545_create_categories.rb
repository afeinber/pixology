class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :description, index: true, null: false
    end
  end
end

class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user, index: true
      t.string :url, null: false
      t.string :thumb_url, null: false
      t.string :medium_url, null: false
      t.string :tiny_url

      t.timestamps
    end
  end
end

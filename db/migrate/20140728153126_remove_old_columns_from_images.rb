class RemoveOldColumnsFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :url
    remove_column :images, :thumb_url
    remove_column :images, :medium_url
    remove_column :images, :tiny_url
  end
end

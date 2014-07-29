class AddNotNullToImage < ActiveRecord::Migration
  def change
    change_column :images, :sharedimg_file_name, :string, :null => false
  end
end

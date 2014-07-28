class AddSharedimgtoImage < ActiveRecord::Migration
   def self.up
    add_attachment :images, :sharedimg
  end

  def self.down
    remove_attachment :images, :sharedimg
  end
end

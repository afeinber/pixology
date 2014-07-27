class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.integer :notified_id, index: true
      t.references :image
      t.boolean :is_read

      t.timestamps
    end
  end
end

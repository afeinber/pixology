class AddColumnBlubToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username
    change_table :users do |t|
      t.string :username, unique: :true
      t.text :blurb
    end
  end
end

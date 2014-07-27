class AddAvatarUsernameColumnsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :username
      t.attachment :avatar
    end
  end
end

class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, index: true, null: false
      t.integer :followee_id
    end
    add_index(:follows, [:followee_id, :user_id], unique: true)
  end
end

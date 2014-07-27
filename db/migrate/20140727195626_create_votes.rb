class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :votable, polymorphic: true, index: true
      t.boolean :is_upvote, null: false
    end
    add_index :votes, [:user_id, :votable_id, :votable_type], unique: true
  end
end

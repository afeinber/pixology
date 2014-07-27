class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :followee, :class_name => "User", :foreign_key => "followee_id"

  validates! :user, :followee, presence: true
  validates! :user, uniqueness: { scope: :followee_id }
end

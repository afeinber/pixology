class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  validates! :votable, :is_upvote, presence: true

end

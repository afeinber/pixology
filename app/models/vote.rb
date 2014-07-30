class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  validates! :votable, presence: true
  validates! :is_upvote, inclusion: { in: [true, false] }

end

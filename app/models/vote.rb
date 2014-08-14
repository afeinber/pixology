class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  validates! :votable, presence: true

end

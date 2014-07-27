class Favorite < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  validates! :image_id, uniqueness: { scope: :user_id }
  validates! :image, :user, presence: true

end

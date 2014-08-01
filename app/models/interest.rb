class Interest < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :user, uniqueness: { scope: :category_id }
  validates :user, :category, presence: true
end

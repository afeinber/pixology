class Category < ActiveRecord::Base
  has_many :images, through: :categorized_images
  has_many :categorized_images
  has_many :interests, dependent: :destroy
  # before_save :get_self_from_database

  validates :description, presence: true, uniqueness: true

  def accordion_five
    self.images.order(created_at: :desc).limit(5)
  end

end

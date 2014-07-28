class Image < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable
  has_many :categories, through: :categorized_images

  has_one :categorized_image, dependent: :destroy

  # This method associates the attribute ":sharedimg" with a file attachment
  has_attached_file :sharedimg, styles: {
    thumb: '200x200>',
    square: '400x400#',
    medium: '600x800>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :sharedimg, :content_type => /\Aimage\/.*\Z/

end

class Image < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable
  has_many :categories, through: :categorized_images

  has_many :categorized_images, dependent: :destroy

  accepts_nested_attributes_for :categories, :allow_destroy => true

  # This method associates the attribute ":sharedimg" with a file attachment
  has_attached_file :sharedimg, styles: {
    thumb: '200>x200>',
    square: '400x400#',
    medium: '600x800>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :sharedimg, :content_type => /\Aimage\/.*\Z/
  validates :sharedimg_file_name, presence: true


  def set_categories(categories)
    categories.each_value do |cat|
      self.categories <<  Category.find_or_create_by(description: cat[:description])
    end
  end
end

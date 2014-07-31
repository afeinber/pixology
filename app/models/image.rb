class Image < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable
  has_many :categories, through: :categorized_images

  has_many :categorized_images, dependent: :destroy

  accepts_nested_attributes_for :categories, :allow_destroy => true

  # This method associates the attribute ":sharedimg" with a file attachment
  has_attached_file :sharedimg, styles: {

    thumb: '200x200#',

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

  def self.search(search, search_method)
    if search.present?
      if search_method == 'Users'
        User.where('username ~* ?', /\A.*#{search}.*\Z/i)
      else
        cats = Category.where('description ILIKE ?', search)
        images = []
        cats.each do |cat|
          images += cat.images
        end
        images.uniq.sort { |a,b| a.created_at <=> b.created_at }.reverse
      end
    else
      Image.order(created_at: :desc)
    end
  end
end

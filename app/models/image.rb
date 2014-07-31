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
  validates :user, presence: true

  def self.hot_right_now
    imgs = self.
        where('created_at > ?', 1.day.ago).
        to_a.
        sort { |a,b| a.votes.where(is_upvote: true).count <=> b.votes.where(is_upvote: true).count }.
        reverse.
        first(12)
    if imgs.count < 12
      imgs += self.first(12 - imgs.count)
    end
    imgs
  end

  def self.rand_images
    imgs = imgs.find(Image.ids.sample(12))
  end
end

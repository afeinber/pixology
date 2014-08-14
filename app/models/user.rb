class User < ActiveRecord::Base

  #include ActionView::Helpers::DateHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :inverse_follows, class_name: 'Follow', foreign_key: 'followee_id', dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :categories, through: :interests
  has_many :votes, dependent: :destroy

  # mailboxer section
  acts_as_messageable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => 'http://s3.amazonaws.com/akk-imgshare/users/avatars/000/000/005/thumb/generic_avatar.jpg?1406895462'

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.member_length(user_create_time)
    member_in_seconds = Time.now - user_create_time
    member_in_seconds = member_in_seconds.to_i.seconds
    time_ago_in_words(Time.now - member_in_seconds)
  end

  #required methods for mailboxer to work
  def name
   self.username
  end

  def mailboxer_email(object)
    self.email
  end


end

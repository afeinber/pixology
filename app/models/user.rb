include ActionView::Helpers::DateHelper

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorties, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :inverse_follows, class_name: 'Follow', foreign_key: 'followee_id', dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :categories, through: :interests
  has_many :notifications, dependent: :destroy
  has_many :votes, dependent: :destroy

  # mailboxer section
  acts_as_messageable
  # Returns the name of the user
  def name
   return self.username
  end

  def mailboxer_email(object)
  #Check if an email should be sent for that object
  #if true
    return self.email
  #if false
  #return nil
  end

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('books-thumb.jpg')
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.member_length(user_create_time)
    member_in_seconds = Time.now - user_create_time
    member_in_seconds = member_in_seconds.to_i.seconds
    time_ago_in_words(Time.now - member_in_seconds)
  end
end

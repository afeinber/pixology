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
  has_many :notifications, dependent: :destroy
  has_many :votes, dependent: :destroy

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

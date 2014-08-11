class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notified, :class_name => "User", :foreign_key => "notified_id"
end

class NotificationsController < ApplicationController
  def index
    @notifications = Notification.order(created_at: :desc)
  end

  def create
    @notification = Notification.new
    @notification.user = current_user
    @notification.notified = User.find(params[:notified])
    @notification.image = Image.find(params[:image])
    @notification.comment = Comment.find(params[:comment])
    @notification.favorite = Favorite.find(params[:favorite])
    @notification.save


    redirect_to :back
  end




  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
  end


  def notification_params
    params.require(:notification).permit()
  end
end

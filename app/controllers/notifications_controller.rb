class NotificationsController < ApplicationController
  respond_to :html, :json

  before_action :authenticate_user!

  def index
  end

  def destroy
    @notification = current_user.mailbox.notifications.find(params[:id])
    @notification.destroy!

    respond_with(@notification)
  end
end

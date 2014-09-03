class FavoritesController < ApplicationController

  respond_to :json

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id

    @favorite.image.user.notify(
      "was favorited",
      "was favorited",
      @favorite
    )

    @favorite.save!
    respond_with(@favorite)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    Mailboxer::Notification.where(notified_object: @favorite).each(&:destroy)
    @favorite.destroy!

    head :no_content
  end

  def favorite_params
    params.require(:favorite).permit(:user_id,:image_id)
  end

end

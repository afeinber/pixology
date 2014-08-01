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

    if @favorite.save
      respond_with(@favorite)
    else
      respond_with(@favorite.errors)
    end

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    Mailboxer::Notification.where(notified_object: @favorite).each(&:destroy)
    @favorite.destroy

    head :no_content
  end

  def favorite_params
    params.require(:favorite).permit(:user_id,:image_id)
  end

end

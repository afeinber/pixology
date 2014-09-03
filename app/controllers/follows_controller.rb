class FollowsController < ApplicationController

  respond_to :json

  def create
    @follow = Follow.new(follow_params)
    @follow.user = current_user

    @follow.save!
    respond_with(@follow)

  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy!

    head :no_content
  end

  def follow_params
    params.require(:follow).permit(:user_id,:followee_id)
  end

end

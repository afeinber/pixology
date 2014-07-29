class FollowsController < ApplicationController

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    head :no_content
  end

end

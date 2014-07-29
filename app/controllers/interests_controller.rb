class InterestsController < ApplicationController

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy

    head :no_content
  end

end

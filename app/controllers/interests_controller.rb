class InterestsController < ApplicationController

  respond_to :json

  def create
    @interest = Interest.find_or_create_by(interest_params)
    @interest.user_id = current_user.id

    if @interest.save
      respond_with(@interest)
    else
      respond_with(@interest.errors)
    end

  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy!

    head :no_content
  end

  private

  def interest_params
    params.require(:interest).permit(:category_id)
  end

end

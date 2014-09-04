class InterestsController < ApplicationController

  respond_to :json

  def create
    # binding.pry
    category = Category.find_or_create_by(category_params)
    interest = Interest.find_or_create_by(category: category, user: current_user)

    interest.save!
    respond_with(interest)
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy!

    head :no_content
  end

  def category_params
    params.require(:category).permit(:description)
  end
end

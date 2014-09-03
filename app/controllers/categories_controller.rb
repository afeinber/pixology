class CategoriesController < ApplicationController

  respond_to :json

  def create
    @category = Category.find_or_create_by(category_params)

    @category.save!
    respond_with(@category)

  end

  private

  def category_params
    params.require(:category).permit(:description)
  end

end

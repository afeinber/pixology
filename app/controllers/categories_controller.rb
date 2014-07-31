class CategoriesController < ApplicationController

  respond_to :json

  def create
    @category = Category.find_or_create_by(category_params)

    if @category.save
      respond_with(@category)
    else
      respond_with(@category.errors)
    end

  end

  private

  def category_params
    params.require(:category).permit(:description)
  end

end

class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end
  def create
    @category = Category.find_or_create_by(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:description)
  end

end

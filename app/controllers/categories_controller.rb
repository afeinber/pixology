class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def new
    @category = Category.new
    
  end
  def create
    @category = Category.find_or_create_by(category_params)
    respond_to do |format|
      format.html {redirect_to categories_url}
      format.js
    end
  end

  private

  def category_params
    params.require(:category).permit(:description)
  end

end

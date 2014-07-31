class SearchesController < ApplicationController

  def create
    @search =  Search.new(search_params)
    if @search.search_type == 'Users'
      @users = @search.search_database
      @tag = @search.query
      render 'users/index'
    else
      @images = @search.search_database
      @tag = @search.query
      render 'images/index'
    end
  end

  private

  def search_params
    params.require(:search).permit(:query, :search_type)
  end

end

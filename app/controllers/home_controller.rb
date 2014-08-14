class HomeController < ApplicationController
  def index
    @hot_right_now = Image.hot_right_now
    @categories = user_signed_in? ? current_user.categories : []
    @fresh_pics = Image.rand_images
  end
end

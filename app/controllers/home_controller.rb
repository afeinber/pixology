class HomeController < ApplicationController
  def index
    @images = Image.order(created_at: :desc)
  end
end

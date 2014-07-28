class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def show
    @profile = User.find(params[:id])
  end

end

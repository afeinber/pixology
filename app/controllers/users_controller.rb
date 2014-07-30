class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @member_length = User.member_length(@user.created_at)
  end




end

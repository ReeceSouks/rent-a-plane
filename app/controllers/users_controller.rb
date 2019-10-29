class UsersController < ApplicationController
  def profile
    @user = current_user
    # @user = User.find(params[:id])
  end
end

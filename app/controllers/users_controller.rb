class UsersController < ApplicationController
  def profile
    @user = current_user
    @bookings = @user.bookings
    # @user = User.find(params[:id])
  end
end

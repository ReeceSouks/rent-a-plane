class UsersController < ApplicationController
  def profile
    @user = current_user
    @bookings = @user.bookings.where("start_date > ?", 1.days.ago)
    @airplanes = @user.airplanes
    # raise
    # @user = User.find(params[:id])
  end
end

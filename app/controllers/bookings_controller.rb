class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    if user_signed_in?
      if current_user.present?
        @profile = current_user
        @airplane = Airplane.find(params[:airplane_id])
        @booking = Booking.new(booking_params)
        @booking.airplane = @airplane
        @booking.user = current_user
        @booking.price = (@booking.end_date - @booking.start_date) * @airplane.price_per_day
    # @booking.airplane = Booking.find(params[:user_id][:airplane_id]) unless params[:user_id][:airplane_id].blank?
        if @booking.save
          redirect_to booking_path(@booking)
          flash[:notice] = 'A trip has been booked!'
        else
          render 'airplanes/show'
        end
      else
        flash[:alert] = 'Please log in before booking'
        redirect_to new_user_session_path
        # I want the user when cannot book because they haven't sign in, after they sign in
        # they get redirected back to the booking page instead of profile page
      end
    else
      flash[:alert] = 'Please log in before booking'
      redirect_to new_user_session_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end
end

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end

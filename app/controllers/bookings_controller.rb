class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @airplane = Airplane.find(params[:airplane_id])
    @booking.airplane = @airplane
    @booking.user = current_user
    @booking.price = (@booking.end_date - @booking.start_date) * @airplane.price_per_day
    # @booking.airplane = Booking.find(params[:user_id][:airplane_id]) unless params[:user_id][:airplane_id].blank?
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'airplanes/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking = @booking.airplane
    @booking.destroy
    redirect_to airplane_path(@airplane)
  end
end

def booking_params
  params.require(:booking).permit(:start_date, :end_date)
end

class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.airplane = @airplane
    @booking.airplane = Booking.find(params[:user_id][:airplane_id]) unless params[:user_id][:airplane_id].blank?
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking = @booking.airplane
    @booking.destroy
    redirect_to airplane_path(@airplane)
  end
end

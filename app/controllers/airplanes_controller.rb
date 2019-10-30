class AirplanesController < ApplicationController
  def index
    @airplanes = Airplane.all
  end

  def show
    set_airplane
    @reviews = @airplane.reviews
    @booking = Booking.new
  end

  def new
    @airplane = Airplane.new
    if user_signed_in?
      if current_user.present?
      else
        redirect_to new_user_registration_path
        flash[:alert] = 'Please sign up before booking'
      end
    else
      redirect_to user_session_path
      flash[:alert] = 'Please log in before booking'
    end
  end

  def create
    @airplane = Airplane.new(airplane_params)
    @airplane.user = current_user
    if @airplane.save
      redirect_to airplane_path(@airplane), notice: "Your plane has been listed!"
    else
      render :new
    end
  end

  def edit
    set_airplane
  end

  def update
    if @airplane.update(airplane_params)
      redirect_to airplane_path(@airplane)
    else
      render :edit
    end
  end

  def destroy
    set_airplane
    @airplane.destroy
    redirect_to airplane_path(@airplane)
  end

  private

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end

  def airplane_params
    params.require(:airplane).permit(:airplane_id, :description, :airport, :price_per_day, :title, :photo)
  end
end

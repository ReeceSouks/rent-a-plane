class AirplanesController < ApplicationController
  def index
    @airplanes = Airplane.geocoded

    @markers = @airplanes.map do |airplane|
      {
        lat: airplane.latitude,
        lng: airplane.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { airplane: airplane })
      }
    end
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
    set_airplane
    if @airplane.update(airplane_params)
      redirect_to airplane_path(@airplane)
    else
      render :edit
    end
  end

  def destroy
    set_airplane
    @airplane.destroy
    redirect_to profile_path
  end

  private

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end

  def airplane_params
    params.require(:airplane).permit(:airplane_id, :description, :airport, :price_per_day, :title, :photo)
  end
end

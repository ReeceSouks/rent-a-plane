class AirplanesController < ApplicationController
  def index
    if params[:query].present? && !Airplane.near(params[:query], 10000).empty?
      @airplanes = Airplane.near(params[:query], 10)
    else
      @airplanes = Airplane.geocoded
      @message = "There are no available planes in your area, please see other locations"
    end
      @markers = @airplanes.map do |airplane|
        {
          lat: airplane.latitude,
          lng: airplane.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { airplane: airplane })
        }
      end
  end
    # when Date.now > Booking.end_date
    # #@airplane.airport = bookings.arrival

  def show
    set_airplane
    authorize @airplane
    @reviews = @airplane.reviews
    @booking = Booking.new
  end

  def new
    @airplane = Airplane.new
    authorize @airplane
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
    authorize @airplane
    @airplane.user = current_user
    if @airplane.save
      redirect_to airplane_path(@airplane), notice: "Your plane has been listed!"
    else
      render :new
    end
  end

  def edit
    set_airplane
    authorize @airplane
  end

  def update
    set_airplane
    authorize @airplane
    if @airplane.update(airplane_params)
      redirect_to airplane_path(@airplane)
    else
      render :edit
    end
  end

  def destroy
    set_airplane
    authorize @airplane
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

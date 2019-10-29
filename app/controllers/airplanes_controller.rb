class AirplanesController < ApplicationController
  def index
    @airplanes = Airplane.all
  end

  def show
    @airplane = Airplane.find(params[:id])
    @reviews = @airplane.reviews
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    if @airplane.save
      redirect_to airplane_path(@airplane), notice: "Your plane has been listed!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @airplane = Airplane.find(params[:id])
    @airplane.destroy
    redirect_to airplane_path(@airplane)
  end

  private

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end

  def airplane_params
    params.require(:airplane).permit(:name)
  end
end

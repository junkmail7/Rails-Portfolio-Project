class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    @spot.save
    redirect_to spot_path(@spot)
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    @spot.save
    redirect_to @spot
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_url
  end

  private

  def spot_params
      params.require(:spot).permit(   :name,
                                      :location,
                                      :location_info)
  end

end
  
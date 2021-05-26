class ObstaclesController < ApplicationController
  def index
    @obstacle = obstacle.all
  end

  def new
    @obstacle = obstacle.new
  end

  def create
    @obstacle = obstacle.new(obstacle_params)
    @obstacle.user_id = current_user.id
    @obstacle.save
    redirect_to obstacle_path(@obstacle)
  end

  def show
    @obstacle = obstacle.find(params[:id])
  end

  def edit
    @obstacle = obstacle.find(params[:id])
  end

  def update
    @obstacle = obstacle.find(params[:id])
    @obstacle.update(obstacle_params)
    @obstacle.save
    redirect_to @obstacle
  end

  def destroy
    @obstacle = obstacle.find(params[:id])
    @obstacle.destroy
    redirect_to obstacle_url
  end

  private

  def obstacle_params
      params.require(:obstacle).permit(   :name,
                                      :location,
                                      :location_info,
                                      :obstacle)
  end

end
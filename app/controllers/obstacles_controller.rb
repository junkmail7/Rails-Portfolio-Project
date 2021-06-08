class ObstaclesController < ApplicationController

  def new
    @obstacle = Obstacle.new
    @obstacle.spot = Spot.find(params[:spot_id])
  end

  def create
    @obstacle = Obstacle.new(obstacle_params)
    @obstacle.user_id = current_user.id
    if @obstacle.valid?
      @obstacle.save!
      redirect_to obstacle_path(@obstacle)
    else
      flash[:errors] = @obstacle.errors.full_messages
      render :new
    end
  end

  def show
    @obstacle = Obstacle.find(params[:id])
    @obstacleratings = @obstacle.obstacle_ratings.reverse
  end

  def edit
    @obstacle = Obstacle.find(params[:id])
    if @obstacle.user_id != current_user.id
      redirect_to obstacle_path(@obstacle)
    end
  end

  def update
    @obstacle = Obstacle.find(params[:id])
    @obstacle.update(obstacle_params)
    if @obstacle.valid?
      redirect_to @obstacle
      @obstacle.save
    else
      flash[:errors] = @obstacle.errors.full_messages
      render :edit
    end
  end

  def destroy
    @obstacle = Obstacle.find(params[:id])
    @obstacle.destroy
    redirect_to spot_path(@obstacle.spot)
  end

  private

  def obstacle_params
      params.require(:obstacle).permit(   :name,
                                      :difficulty_rating,
                                      :spot_id)
  end

end
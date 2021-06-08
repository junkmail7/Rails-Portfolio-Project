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
    if @spot.valid?
      @spot.save
      redirect_to spot_path(@spot)
    else
      flash[:errors] = @spot.errors.full_messages
      render :new
    end
  end

  def show
    if params[:id] == "most-comments"
      @spot = Spot.find(Comment.mostcomms.spot_id) 
    else
      @spot = Spot.find(params[:id])
    end
    @comments = @spot.comments.reverse
  end

  def edit
    @spot = Spot.find(params[:id])
    if @spot.user_id != current_user.id
      redirect_to spot_path(@spot)
    end
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    if @spot.valid?
      @spot.save
      redirect_to @spot
    else
      flash[:errors] = @spot.errors.full_messages
      render :edit
    end
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
  
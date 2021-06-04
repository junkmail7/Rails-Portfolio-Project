class ObstacleRatingsController < ApplicationController
    def create
        o = ObstacleRating.new
        o.user_id = current_user.id
        o.obstacle_id = params[:obstacle_id]
        o.rating = params[:rating]
        o.save
        redirect_to obstacle_path(o.obstacle)
    end
end
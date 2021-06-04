class AddObstacleIdToObstacleRatings < ActiveRecord::Migration[6.0]
    def change
      add_column :obstacle_ratings, :obstacle_id, :integer
    end
end
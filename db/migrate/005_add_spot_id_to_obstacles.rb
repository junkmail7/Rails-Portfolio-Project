class AddSpotIdToObstacles < ActiveRecord::Migration[6.0]
    def change
      add_column :obstacles, :spot_id, :integer
    end
end
class CreateObstacleRatings < ActiveRecord::Migration[6.0]
    def change
      create_table :obstacle_ratings do |t|
        t.string :rating
  
        t.references :user, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end
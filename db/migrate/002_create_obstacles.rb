class CreateObstacles < ActiveRecord::Migration[6.0]
    def change
      create_table :obstacles do |t|
        t.string :name
        t.string :difficulty_rating
  
        t.references :user, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end
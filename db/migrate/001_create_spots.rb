class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :location
      t.string :location_info
      t.string :obstacles

      t.timestamps
    end
  end
end
class AddSpotIdToComments < ActiveRecord::Migration[6.0]
    def change
      add_column :comments, :spot_id, :integer
    end
end
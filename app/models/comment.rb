class Comment < ApplicationRecord
    belongs_to :spot
    belongs_to :user
    
    scope :mostcomms, -> {  select('spot_id, count(spot_id) as count').group(:spot_id).order('count desc').first }
end
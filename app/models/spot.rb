class Spot < ApplicationRecord
    belongs_to :user
    has_many :comments
    
    has_many :obstacles
    has_many :obstacle_ratings, :through => :obstacles
end
class Spot < ApplicationRecord
    has_many :comments
    has_many :obstacles
    has_many :obstacle_ratings, :through => :obstacles
end
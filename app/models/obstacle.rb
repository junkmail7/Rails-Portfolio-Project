class Obstacle < ApplicationRecord
    belongs_to :spot
    has_many :obstacle_ratings
end
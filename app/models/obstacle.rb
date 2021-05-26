class Obstacle < ApplicationRecord
    belongs_to :spot
    accepts_nested_attributes_for :spot
    has_many :obstacle_ratings
end
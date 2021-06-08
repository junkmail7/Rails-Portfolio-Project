class Obstacle < ApplicationRecord
    belongs_to :spot
    has_many :obstacle_ratings

    validates :name, presence: true, uniqueness: true
    validates :difficulty_rating, presence: true, uniqueness: true
end
class Obstacle < ApplicationRecord
    belongs_to :spot
    has_many :obstacle_ratings, dependent: :destroy

    validates :name, presence: true, uniqueness: true
    validates :difficulty_rating, presence: true

    def avg
        if self.obstacle_ratings.length > 0
            x = 0
            self.obstacle_ratings.each do |obrat|
                x = x + obrat.rating.to_i
            end
            x = x/self.obstacle_ratings.length
            return x
        end
    end
             
end
class Route < ApplicationRecord
    validates :route_id, presence: true, length: { maximum: 13 } 
    validates :source, presence: true
    validates :destination, presence: true
    validates :distance, presence: true
    has_many :buses
    has_many :stops
end
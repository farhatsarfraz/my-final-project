class Route < ApplicationRecord
    validates_presence_of :source, :destination, :destination
    has_and_belongs_to_many :stops
    has_and_belongs_to_many :buses
end
class Stop < ApplicationRecord
    has_and_belongs_to_many :routes
    validates :longitude, :latitude, :name, presence: true
    validates_uniqueness_of :name
    validates_uniqueness_of :longitude, scope: :latitude
end

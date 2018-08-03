class Stop < ApplicationRecord
  has_and_belongs_to_many :routes

  validates_presence_of :longitude, :latitude, :name
  validates_uniqueness_of :name
  validates_uniqueness_of :longitude, scope: :latitude
end

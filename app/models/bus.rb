class Bus < ApplicationRecord
  has_and_belongs_to_many :routes
  belongs_to :driver, class_name: 'User'
  has_many :buses_routes

  validates :regestration_no, presence: true, length: { maximum: 10 }
end

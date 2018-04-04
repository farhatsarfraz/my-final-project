class Bus < ApplicationRecord
    validates :bus_no, presence: true, length: { maximum: 10 }
    has_many :routes
end
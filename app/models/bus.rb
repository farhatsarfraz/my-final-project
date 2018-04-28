class Bus < ApplicationRecord
    validates :bus_no, presence: true, length: { maximum: 10 }
    has_and_belongs_to_many :routes
end
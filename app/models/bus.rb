class Bus < ApplicationRecord
    validates :regestration_no, presence: true, length: { maximum: 10 }
    has_and_belongs_to_many :routes
    has_many :timings
    has_many :comments, dependent: :destroy
end
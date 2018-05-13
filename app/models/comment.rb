class Comment  < ApplicationRecord
    validates :description, presence: true, length: { minimum: 3, maximum: 3000}
    belongs_to :user
    belongs_to :bus
    validates :user_id, presence: true
    validates :bus_id, presence: true
end
class Stop < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :routes
end
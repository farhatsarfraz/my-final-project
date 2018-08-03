class Route < ApplicationRecord
  has_and_belongs_to_many :stops
  has_and_belongs_to_many :buses
  has_many :buses_routes
  belongs_to :start_stop, class_name: 'Stop'
  belongs_to :end_stop, class_name: 'Stop'

  validates_presence_of :start_stop_id, :start_stop_id, :name
  validates_uniqueness_of :name

  validate :start_and_end_stop_can_not_be_same, on: :create


  def start_and_end_stop_can_not_be_same
    errors.add(:start_stop, "can't be in the past") if start_stop.id == end_stop.id
  end
end

class ChangeLatLongTypeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :stops, :latitude, :string
    change_column :stops, :longitude, :string
  end
end

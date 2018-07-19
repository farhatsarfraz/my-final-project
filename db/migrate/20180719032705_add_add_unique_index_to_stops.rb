class AddAddUniqueIndexToStops < ActiveRecord::Migration[5.1]
  def change
    add_index :stops, [:latitude, :longitude], unique: true
    add_index :stops, :name, unique: true
  end
end

class AddStopsIdToTiming < ActiveRecord::Migration[5.1]
  def change
    add_column :timings, :stops_id, :integer
  end
end

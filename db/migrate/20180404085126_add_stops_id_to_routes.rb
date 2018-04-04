class AddStopsIdToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :stops_id, :integer
  end
end

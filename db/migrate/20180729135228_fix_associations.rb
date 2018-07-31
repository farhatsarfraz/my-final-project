class FixAssociations < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :start_stop_id, :bigint, null: false
    add_column :routes, :end_stop_id, :bigint, null: false
    add_column :buses, :driver_id, :bigint
    add_column :buses_routes, :name, :string
    # Make associations

    remove_column :routes, :source, :string
    remove_column :routes, :destination, :string

    drop_table :timings do
    end

    create_table :bus_route_timings do |t|
      t.belongs_to :buses_route, index: true
      t.belongs_to :routes_stop, index: true
      t.time :arrival_time

      t.timestamps
    end
  end
end

class CreateRoutesStops < ActiveRecord::Migration[5.1]
  def change
    create_table :routes_stops do |t|
      t.belongs_to :route, index: true
      t.belongs_to :stop, index: true
      t.timestamps
    end
  end
end

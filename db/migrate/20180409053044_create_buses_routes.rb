class CreateBusesRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :buses_routes do |t|
      t.belongs_to :bus, index: true
      t.belongs_to :route, index: true
      t.timestamps
    end
  end
end

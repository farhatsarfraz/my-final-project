class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.integer :route_id
      t.string :source
      t.string :destination
      t.string :distance
      t.string :time
    end
  end
end

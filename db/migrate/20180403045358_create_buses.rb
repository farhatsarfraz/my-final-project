class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.integer :bus_id
      t.integer :bus_no
      t.integer :no_of_seates
      t.timestamps
    end
  end
end

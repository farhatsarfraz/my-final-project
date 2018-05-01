class CreateTiming < ActiveRecord::Migration[5.1]
  def change
    create_table :timings do |t|
      t.string :arrival_time 
      t.string :departure_time 
      t.timestamps
    end
  end
end

class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.string :regestration_no, null: false, default: ""
      t.integer :no_of_seates
      t.timestamps
    end
  end
end

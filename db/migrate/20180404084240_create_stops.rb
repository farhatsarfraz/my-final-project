class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end

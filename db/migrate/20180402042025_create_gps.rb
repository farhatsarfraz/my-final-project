class CreateGps < ActiveRecord::Migration[5.1]
  def change
    create_table :gps do |t|
      t.float :longitude
      t.float :latitude
    end
  end
end

class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      
      t.string :source
      t.string :destination
      t.string :distance
      t.string :time
      t.timestamps
    end
  end
end

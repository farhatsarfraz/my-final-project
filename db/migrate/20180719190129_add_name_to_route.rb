class AddNameToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :name, :string, null: true
  end
end

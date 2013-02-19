class AddCylindersToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :cylinders, :integer
  end
end

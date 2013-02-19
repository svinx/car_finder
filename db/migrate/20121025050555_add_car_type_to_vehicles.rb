class AddCarTypeToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :car_type, :string
  end
end

class AddMileageToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :mileage, :integer
  end
end

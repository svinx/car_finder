class AddTransmissionToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :transmission, :string
  end
end

class AddIpAddressToVehicleStatistics < ActiveRecord::Migration
  def change
    add_column :vehicle_statistics, :ip_address, :string
  end
end

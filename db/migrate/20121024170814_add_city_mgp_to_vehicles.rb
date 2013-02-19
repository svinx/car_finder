class AddCityMgpToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :city_mpg, :integer
  end
end

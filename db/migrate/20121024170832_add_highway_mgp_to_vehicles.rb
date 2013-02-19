class AddHighwayMgpToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :highway_mpg, :integer
  end
end

class AddInteriorColorToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :interior_color, :string
  end
end

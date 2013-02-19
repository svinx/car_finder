class AddExteriorColorToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :exterior_color, :string
  end
end

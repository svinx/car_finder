class AddBodyToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :body, :string
  end
end

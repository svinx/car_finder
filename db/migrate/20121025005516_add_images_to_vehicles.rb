class AddImagesToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :images, :text
  end
end

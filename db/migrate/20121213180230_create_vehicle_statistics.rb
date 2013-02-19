class CreateVehicleStatistics < ActiveRecord::Migration
  def change
    create_table :vehicle_statistics do |t|
      t.integer :vehicle_id
      t.integer :impressions
      t.integer :views

      t.timestamps
    end
  end
end

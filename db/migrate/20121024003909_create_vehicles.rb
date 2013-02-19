class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :dealer_id
      t.boolean :listed
      t.integer :price
      t.integer :year
      t.string :make
      t.string :model

      t.timestamps
    end
  end
end

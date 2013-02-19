class AddInventoryIdToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :inventory_id, :string
  end
end

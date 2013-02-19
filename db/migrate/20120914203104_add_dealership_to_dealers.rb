class AddDealershipToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :dealership, :string
  end
end

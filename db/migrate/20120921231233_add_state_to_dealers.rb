class AddStateToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :state, :string
  end
end

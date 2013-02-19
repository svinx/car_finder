class AddCellPhoneToDealer < ActiveRecord::Migration
  def change
    add_column :dealers, :cell_phone, :string
  end
end

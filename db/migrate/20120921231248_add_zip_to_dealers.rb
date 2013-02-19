class AddZipToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :zip, :string
  end
end

class AddLogoToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :logo, :string
  end
end

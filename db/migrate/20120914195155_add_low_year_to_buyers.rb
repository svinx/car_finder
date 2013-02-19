class AddLowYearToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :low_year, :integer
  end
end

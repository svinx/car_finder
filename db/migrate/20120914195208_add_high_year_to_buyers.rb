class AddHighYearToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :high_year, :integer
  end
end

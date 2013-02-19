class AddMilesToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :miles, :string
  end
end

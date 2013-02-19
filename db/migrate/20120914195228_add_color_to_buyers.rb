class AddColorToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :color, :string
  end
end

class AddIpToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :ip, :string
  end
end

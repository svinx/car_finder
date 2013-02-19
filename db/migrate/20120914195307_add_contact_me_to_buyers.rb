class AddContactMeToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :contact_me, :boolean
  end
end

class AddRepliesToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :replies, :integer
  end
end

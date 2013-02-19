class AddAccountCurrentToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :account_current, :boolean
  end
end

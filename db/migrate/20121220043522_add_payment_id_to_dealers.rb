class AddPaymentIdToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :payment_id, :string
  end
end

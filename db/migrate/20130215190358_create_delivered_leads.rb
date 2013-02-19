class CreateDeliveredLeads < ActiveRecord::Migration
  def change
    create_table :delivered_leads do |t|
      t.integer :dealer_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end

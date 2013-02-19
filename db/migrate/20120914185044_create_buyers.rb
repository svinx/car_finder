class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :phone
      t.string :make
      t.string :model

      t.timestamps
    end
  end
end

class AddPhoneToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :phone, :string
  end
end

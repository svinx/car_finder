class CreateCarTips < ActiveRecord::Migration
  def change
    create_table :car_tips do |t|
      t.string :kind_of
      t.text :tip

      t.timestamps
    end
  end
end

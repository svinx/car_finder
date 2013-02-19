class CreateAboutMakes < ActiveRecord::Migration
  def change
    create_table :about_makes do |t|
      t.string :make
      t.text :summary

      t.timestamps
    end
  end
end

class CreateCarCompassFacts < ActiveRecord::Migration
  def change
    create_table :car_compass_facts do |t|
      t.text :fact

      t.timestamps
    end
  end
end

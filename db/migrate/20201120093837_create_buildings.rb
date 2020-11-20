class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.integer :building_type_id
      t.integer :builder_id

      t.timestamps
    end
  end
end

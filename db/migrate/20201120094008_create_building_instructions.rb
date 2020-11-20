class CreateBuildingInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :building_instructions do |t|
      t.string :building_type_name
      t.integer :points_value
      t.integer :steel_cost
      t.integer :clay_cost
      t.integer :grain_cost
      t.float :steel_drop_prob
      t.float :clay_drop_prob
      t.float :grain_drop_prob
      t.integer :buildings_count

      t.timestamps
    end
  end
end

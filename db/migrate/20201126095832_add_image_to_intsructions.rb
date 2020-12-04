class AddImageToIntsructions < ActiveRecord::Migration[6.0]
  def change
    add_column :building_instructions, :image, :string
  end
end

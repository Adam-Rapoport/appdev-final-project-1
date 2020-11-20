class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :kingdom
      t.integer :steel_amount
      t.integer :clay_amount
      t.integer :grain_amount
      t.integer :points
      t.integer :buildings_count
      t.integer :sent_requests_count
      t.integer :received_requests_count

      t.timestamps
    end
  end
end

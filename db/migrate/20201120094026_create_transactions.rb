class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :steel_offered
      t.integer :clay_offered
      t.integer :grain_offered
      t.integer :steel_requested
      t.integer :clay_requested
      t.integer :grain_requested
      t.string :status
      t.text :greetings

      t.timestamps
    end
  end
end

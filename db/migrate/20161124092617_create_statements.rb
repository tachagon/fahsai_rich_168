class CreateStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :statements do |t|
      t.integer :giver_id
      t.integer :receiver_id
      t.float :total_price
      t.float :total_pv

      t.timestamps
    end
  end
end

class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.belongs_to :user, index:true
      t.belongs_to :product, index:true
      t.integer :quantity

      t.timestamps
    end
  end
end

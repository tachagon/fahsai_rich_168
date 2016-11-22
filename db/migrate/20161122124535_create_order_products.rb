class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.belongs_to :product, index:true
      t.belongs_to :order, index:true
      t.integer :quantity
      t.float :total_price
      t.float :total_pv
      t.timestamps
    end
  end
end

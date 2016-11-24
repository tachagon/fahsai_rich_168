class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.belongs_to :role, index:true
      t.belongs_to :product, index:true
      t.float :amount

      t.timestamps
    end
  end
end

class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :benefit_layer
      t.float :min_pv

      t.timestamps
    end
  end
end

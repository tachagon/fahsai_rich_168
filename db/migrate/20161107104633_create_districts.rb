class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.references :amphur, foreign_key: true
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
    add_index :districts, :name
    add_index :districts, [:name, :amphur_id], unique: true
  end
end

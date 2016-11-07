class CreateDistrictZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :district_zipcodes do |t|
      t.references :district, foreign_key: true
      t.references :zipcode, foreign_key: true

      t.timestamps
    end
    add_index :district_zipcodes, [:district_id, :zipcode_id], unique: true
  end
end

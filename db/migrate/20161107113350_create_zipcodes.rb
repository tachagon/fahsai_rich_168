class CreateZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.string :code

      t.timestamps
    end
    add_index :zipcodes, :code, unique: true
  end
end

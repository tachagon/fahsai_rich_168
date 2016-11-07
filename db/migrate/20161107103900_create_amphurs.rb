class CreateAmphurs < ActiveRecord::Migration[5.0]
  def change
    create_table :amphurs do |t|
      t.string :name
      t.references :province, foreign_key: true

      t.timestamps
    end
    add_index :amphurs, :name
    add_index :amphurs, [:name, :province_id], unique: true
  end
end

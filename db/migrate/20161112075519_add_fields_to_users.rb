class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :member_code, :string
    add_index :users, :member_code, unique: true
    add_column :users, :iden_number, :string
    add_index :users, :iden_number, unique: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_reference :users, :district, foreign_key: true
    add_reference :users, :amphur, foreign_key: true
    add_reference :users, :province, foreign_key: true
    add_reference :users, :zipcode, foreign_key: true
    add_column :users, :phone_number, :string
    add_column :users, :line_id, :string
    add_reference :users, :role, foreign_key: true
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
  end
end

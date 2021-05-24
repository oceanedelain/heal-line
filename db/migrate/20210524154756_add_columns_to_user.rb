class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
    add_column :users, :ssn, :integer
    add_column :users, :phone_number, :integer
    add_column :users, :address, :string
    add_column :users, :blood_group, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :allergies, :string
    add_column :users, :treatments, :string
  end
end

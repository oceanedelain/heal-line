class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialty
      t.integer :phone_number
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end

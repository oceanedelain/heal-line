class ChangePhoneNumberTypeToDoctors < ActiveRecord::Migration[6.1]
  def change
    change_column :doctors, :phone_number, :string
  end
end

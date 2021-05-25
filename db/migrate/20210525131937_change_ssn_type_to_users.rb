class ChangeSsnTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :ssn, :string
    change_column :users, :height, :string
    change_column :users, :weight, :string
  end
end

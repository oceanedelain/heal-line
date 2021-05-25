class AddTimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :time, :time
  end
end

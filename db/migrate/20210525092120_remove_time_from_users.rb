class RemoveTimeFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :time, :time
  end
end

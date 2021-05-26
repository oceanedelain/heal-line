class ChangeDateTypeInSymptoms < ActiveRecord::Migration[6.1]
  def change
    change_column :symptoms, :date, :datetime
    rename_column :symptoms, :date, :at
  end
end

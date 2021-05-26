class ChangeDateTimeColumnsInConsultations < ActiveRecord::Migration[6.1]
  def change
    remove_column :consultations, :time
    change_column :consultations, :date, :datetime
    rename_column :consultations, :date, :at
  end
end

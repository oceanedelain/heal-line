class AddTimeToConsultations < ActiveRecord::Migration[6.1]
  def change
    add_column :consultations, :time, :time
  end
end

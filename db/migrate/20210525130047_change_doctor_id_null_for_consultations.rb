class ChangeDoctorIdNullForConsultations < ActiveRecord::Migration[6.1]
  def change
    change_column :consultations, :doctor_id, :bigint, null: true
  end
end

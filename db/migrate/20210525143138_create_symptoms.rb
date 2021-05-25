class CreateSymptoms < ActiveRecord::Migration[6.1]
  def change
    create_table :symptoms do |t|
      t.date :date
      t.string :name
      t.string :zone
      t.text :notes
      t.integer :intensity
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

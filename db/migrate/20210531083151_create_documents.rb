class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :notes
      t.datetime :at
      t.references :user, null: false, foreign_key: true
      t.references :consultation, foreign_key: true
      t.references :symptom, foreign_key: true

      t.timestamps
    end
  end
end

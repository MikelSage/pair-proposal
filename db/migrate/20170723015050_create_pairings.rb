class CreatePairings < ActiveRecord::Migration[5.1]
  def change
    create_table :pairings do |t|
      t.references :topic, foreign_key: true
      t.references :tutor_date, foreign_key: true
      t.integer :pupil_id, foreign_key: true
      t.integer :tutor_id, foreign_key: true

      t.timestamps
    end
  end
end

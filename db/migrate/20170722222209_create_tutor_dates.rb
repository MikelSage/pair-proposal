class CreateTutorDates < ActiveRecord::Migration[5.1]
  def change
    create_table :tutor_dates do |t|
      t.datetime :date
      t.integer :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

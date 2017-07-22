class CreateTutorDates < ActiveRecord::Migration[5.1]
  def change
    create_table :tutor_dates do |t|
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end

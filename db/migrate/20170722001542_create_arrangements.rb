class CreateArrangements < ActiveRecord::Migration[5.1]
  def change
    create_table :arrangements do |t|
      t.references :user, foreign_key: true
      t.references :tutor_date, foreign_key: true
      t.integer :duration

      t.timestamps
    end
  end
end

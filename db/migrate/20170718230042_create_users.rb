class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :role, default: 0
      t.string :name
      t.text :bio, default: 'Tell us about yourself!'

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :role

      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end

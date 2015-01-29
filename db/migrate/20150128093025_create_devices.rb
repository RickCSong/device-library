class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :hardware
      t.string :operating_system
      t.string :storage_code, null: false
      t.string :barcode, null: false
      t.integer :status, default: 0, null: false
      t.text :details
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true, null: false

      t.timestamps null: false
    end

    add_index :devices, :barcode, unique: true
    add_foreign_key :devices, :users
    add_foreign_key :devices, :categories
  end
end

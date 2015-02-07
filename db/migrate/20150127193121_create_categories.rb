class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end

    add_index :categories, :name, unique: true
    add_index :categories, :slug, unique: true
    add_index :categories, :code, unique: true
  end
end


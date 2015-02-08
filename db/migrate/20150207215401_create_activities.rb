class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :device, index: true, null: false
      t.string :status_from, null: false
      t.string :status_to, null: false

      t.timestamps null: false
    end

    add_foreign_key :activities, :users
    add_foreign_key :activities, :devices
  end
end

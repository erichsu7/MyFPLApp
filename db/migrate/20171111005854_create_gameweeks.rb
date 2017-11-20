class CreateGameweeks < ActiveRecord::Migration
  def change
    create_table :gameweeks do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.datetime :deadline_time, null: false
      t.integer :deadline_time_epoch, null: false

      t.timestamps null: false
    end

    add_index :gameweeks, :number, unique: true
  end
end

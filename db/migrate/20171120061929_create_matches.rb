class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :gameweek_id, null: false
      t.integer :event_day, null: false
      t.integer :code, null: false
      t.datetime :kickoff_time, null: false

      t.timestamps null: false
    end
  end
end

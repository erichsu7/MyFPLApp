class CreateMatchTeams < ActiveRecord::Migration
  def change
    create_table :match_teams do |t|
      t.integer :match_id, null: false
      t.integer :team_id, null: false
      t.string :side, null: false
      t.integer :difficulty, null: false
      t.integer :goals

      t.timestamps null: false
    end
  end
end

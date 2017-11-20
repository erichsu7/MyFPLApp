class AddIndexes < ActiveRecord::Migration
  def change
    add_index :teams, :code, unique: true
    add_index :matches, :gameweek_id
    add_index :matches, :code
    add_index :match_teams, :match_id
    add_index :match_teams, :team_id
    add_index :match_teams, [:match_id, :team_id], unique: true
  end
end

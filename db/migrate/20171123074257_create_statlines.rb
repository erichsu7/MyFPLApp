class CreateStatlines < ActiveRecord::Migration
  def change
    create_table :statlines do |t|
      t.integer :player_id, null: false
      t.integer :match_team_id, null: false
      t.integer :points, null: false
      t.integer :value, null: false
      t.integer :transfers_balance
      t.integer :selected
      t.integer :transfers_in
      t.integer :transfers_out
      t.integer :minutes
      t.integer :goals_scored
      t.integer :assists
      t.integer :clean_sheets
      t.integer :goals_conceded
      t.integer :own_goals
      t.integer :penalties_saved
      t.integer :penalties_missed
      t.integer :yellow_cards
      t.integer :red_cards
      t.integer :saves
      t.integer :bonus
      t.integer :bps
      t.decimal :influence, precision: 4, scale: 1
      t.decimal :creativity, precision: 4, scale: 1
      t.decimal :threat, precision: 4, scale: 1
      t.decimal :ict_index, precision: 4, scale: 1
      t.integer :open_play_crosses
      t.integer :big_chances_created
      t.integer :clearances_blocks_interceptions
      t.integer :recoveries
      t.integer :key_passes
      t.integer :tackles
      t.integer :winning_goals
      t.integer :attempted_passes
      t.integer :completed_passes
      t.integer :penalties_conceded
      t.integer :big_chances_missed
      t.integer :errors_leading_to_goal
      t.integer :errors_leading_to_goal_attempt
      t.integer :tackled
      t.integer :offside
      t.integer :target_missed
      t.integer :fouls
      t.integer :dribbles

      t.timestamps null: false
    end

    add_index :statlines, :player_id
    add_index :statlines, :match_team_id
    add_index :statlines, [:player_id, :match_team_id], unique: true
  end
end

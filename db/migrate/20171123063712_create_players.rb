class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :display_name, null: false
      t.integer :team_code
      t.string :status
      t.integer :code, null: false
      t.string :photo
      t.integer :squad_number
      t.integer :cost
      t.integer :cost_change_start
      t.integer :cost_change_gameweek
      t.integer :chance_of_playing_this_round
      t.integer :chance_of_playing_next_round
      t.decimal :value_form, precision: 3, scale: 1
      t.decimal :value_season, precision: 3, scale: 1
      t.decimal :selected_by_percent, precision: 4, scale: 1
      t.decimal :form, precision: 3, scale: 1
      t.integer :transfers_out
      t.integer :transfers_in
      t.integer :transfers_out_gameweek
      t.integer :transfers_in_gameweek
      t.integer :total_points
      t.decimal :points_per_match, precision: 3, scale: 1
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
      t.decimal :influence, precision: 6, scale: 1
      t.decimal :creativity, precision: 5, scale: 1
      t.decimal :threat, precision: 5, scale: 1
      t.decimal :ict_index, precision: 5, scale: 1
      t.integer :position_id
      t.integer :team_id

      t.timestamps null: false
    end

    add_index :players, :team_id
    add_index :players, :position_id
  end
end

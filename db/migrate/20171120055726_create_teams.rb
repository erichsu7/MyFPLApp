class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :short_name, null: false
      t.integer :code, null: false
      t.integer :strength
      t.integer :strength_overall_home
      t.integer :strength_overall_away
      t.integer :strength_attack_home
      t.integer :strength_attack_away
      t.integer :strength_defence_home
      t.integer :strength_defence_away
      t.integer :team_division

      t.timestamps null: false
    end
  end
end

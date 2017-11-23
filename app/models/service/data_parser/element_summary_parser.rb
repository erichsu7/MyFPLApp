class Service::DataParser::ElementSummaryParser

  def initialize(player_id, data)
    @player_id = player_id
    @data = data
  end

  def call
    # just parse player history for now
    @data["history"].each do |gameweek_data|
      gameweek_id = gameweek_data["round"]
      opponent_team_id = gameweek_data["opponent_team"]
      # find opponent match team then find player's from that
      match_team = MatchTeam.find_by_gameweek_id_and_team_id(
        gameweek_id,
        opponent_team_id
      ).try(:opposite_match_team)

      if match_team.nil?
        raise "#{self.class}: could not find MatchTeam (gameweek_id: " +
              "#{gameweek_id}, opponent_team_id: #{opponent_team_id})"
      end

      statline = Statline.find_or_initialize_by(
        match_team_id: match_team.id,
        player_id: @player_id
      )
      statline.update(
        points: gameweek_data["total_points"],
        value: gameweek_data["value"],
        transfers_balance: gameweek_data["transfers_balance"],
        selected: gameweek_data["selected"],
        transfers_in: gameweek_data["transfers_in"],
        transfers_out: gameweek_data["transfers_out"],
        minutes: gameweek_data["minutes"],
        goals_scored: gameweek_data["goals_scored"],
        assists: gameweek_data["assists"],
        clean_sheets: gameweek_data["clean_sheets"],
        goals_conceded: gameweek_data["goals_conceded"],
        own_goals: gameweek_data["own_goals"],
        penalties_saved: gameweek_data["penalties_saved"],
        penalties_missed: gameweek_data["penalties_missed"],
        yellow_cards: gameweek_data["yellow_cards"],
        red_cards: gameweek_data["red_cards"],
        saves: gameweek_data["saves"],
        bonus: gameweek_data["bonus"],
        bps: gameweek_data["bps"],
        influence: gameweek_data["influence"],
        creativity: gameweek_data["creativity"],
        threat: gameweek_data["threat"],
        ict_index: gameweek_data["ict_index"],
        open_play_crosses: gameweek_data["open_play_crosses"],
        big_chances_created: gameweek_data["big_chances_created"],
        clearances_blocks_interceptions: gameweek_data["clearances_blocks_interceptions"],
        recoveries: gameweek_data["recoveries"],
        key_passes: gameweek_data["key_passes"],
        tackles: gameweek_data["tackles"],
        winning_goals: gameweek_data["winning_goals"],
        attempted_passes: gameweek_data["attempted_passes"],
        completed_passes: gameweek_data["completed_passes"],
        penalties_conceded: gameweek_data["penalties_conceded"],
        big_chances_missed: gameweek_data["big_chances_missed"],
        errors_leading_to_goal: gameweek_data["errors_leading_to_goal"],
        errors_leading_to_goal_attempt: gameweek_data["errors_leading_to_goal_attempt"],
        tackled: gameweek_data["tackled"],
        offside: gameweek_data["offside"],
        target_missed: gameweek_data["target_missed"],
        fouls: gameweek_data["fouls"],
        dribbles: gameweek_data["dribbles"]
      )
    end
  end

end

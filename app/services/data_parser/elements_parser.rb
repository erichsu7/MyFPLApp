class DataParser::ElementsParser

  def initialize(elements)
    @elements = elements
  end

  def call
    @elements.each do |element|
      player = Player.find_or_initialize_by(code: element["code"])
      player.update(
        first_name: element["first_name"],
        last_name: element["second_name"],
        display_name: element["web_name"],
        team_code: element["team_code"],
        status: element["status"],
        photo: element["photo"],
        squad_number: element["squad_number"],
        cost: element["now_cost"],
        cost_change_start: element["cost_change_start"],
        cost_change_gameweek: element["cost_change_event"],
        chance_of_playing_this_round: element["chance_of_playing_this_round"],
        chance_of_playing_next_round: element["chance_of_playing_next_round"],
        value_form: element["value_form"].to_f,
        value_season: element["value_season"].to_f,
        selected_by_percent: element["selected_by_percent"].to_f,
        form: element["form"].to_f,
        transfers_out: element["transfers_out"],
        transfers_in: element["transfers_in"],
        transfers_out_gameweek: element["transfers_out_event"],
        transfers_in_gameweek: element["transfers_in_event"],
        total_points: element["total_points"],
        points_per_match: element["points_per_game"].to_f,
        minutes: element["minutes"],
        goals_scored: element["goals_scored"],
        assists: element["assists"],
        clean_sheets: element["clean_sheets"],
        goals_conceded: element["goals_conceded"],
        own_goals: element["own_goals"],
        penalties_saved: element["penalties_saved"],
        penalties_missed: element["penalties_missed"],
        yellow_cards: element["yellow_cards"],
        red_cards: element["red_cards"],
        saves: element["saves"],
        bonus: element["bonus"],
        bps: element["bps"],
        influence: element["influence"].to_f,
        creativity: element["creativity"].to_f,
        threat: element["threat"].to_f,
        ict_index: element["ict_index"].to_f,
        position_id: element["element_type"],
        team_id: element["team"]
      )
    end
  end

end

class Service::DataParser::TeamsParser

  def initialize(teams)
    @teams = teams
  end

  def call
    @teams.each do |team|
      team_model = Team.find_or_initialize_by(
        name: team["name"],
        short_name: team["short_name"],
        code: team["code"]
      )
      team_model.update(
        strength: team["strength"],
        strength_overall_home: team["strength_overall_home"],
        strength_overall_away: team["strength_overall_away"],
        strength_attack_home: team["strength_attack_home"],
        strength_attack_away: team["strength_attack_away"],
        strength_defence_home: team["strength_defence_home"],
        strength_defence_away: team["strength_defence_away"],
        team_division: team["team_division"]
      )
    end
  end

end

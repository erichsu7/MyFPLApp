class DataParser::FixturesParser

  def initialize(fixtures)
    @fixtures = fixtures
  end

  def call
    @fixtures.each do |fixture|
      create_match_from_fixture(fixture)
      create_home_match_team_from_fixture(fixture)
      create_away_match_team_from_fixture(fixture)
    end
  end

  private

  def create_match_from_fixture(fixture)
    gameweek = Gameweek.find_by(number: fixture["event"])
    @match = Match.find_or_initialize_by(code: fixture["code"])
    @match.update(
      gameweek_id: gameweek.id,
      event_day: fixture["event_day"],
      kickoff_time: fixture["kickoff_time"]
    )
  end

  def create_home_match_team_from_fixture(fixture)
    home_team = Team.find_by(id: fixture["team_h"])
    @home_match_team = MatchTeam.find_or_initialize_by(
      match_id: @match.id,
      team_id: home_team.id,
      side: "home"
    )
    @home_match_team.update(
      difficulty: fixture["team_h_difficulty"],
      goals: fixture["team_h_score"]
    )
  end

  def create_away_match_team_from_fixture(fixture)
    away_team = Team.find_by(id: fixture["team_a"])
    @away_match_team = MatchTeam.find_or_initialize_by(
      match_id: @match.id,
      team_id: away_team.id,
      side: "away"
    )
    @away_match_team.update(
      difficulty: fixture["team_a_difficulty"],
      goals: fixture["team_a_score"]
    )
  end

end

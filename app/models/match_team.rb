class MatchTeam < ActiveRecord::Base
  validate :team_has_no_other_matches_in_gameweek?

  belongs_to :match
  belongs_to :team
  has_many :statlines

  def self.find_by_gameweek_id_and_team_id(gameweek_id, team_id)
    self.includes(match: [:match_teams, :gameweek])
        .where(gameweeks: { id: gameweek_id })
        .where(team_id: team_id)
        .last
  end

  def opposite_match_team
    match.match_teams.reject { |mt| mt == self }.first
  end

  private

  def team_has_no_other_matches_in_gameweek?
    if team.matches.any? { |m| m.gameweek_id == match.gameweek_id }
      errors.add(:team, "already has match in gameweek")
    end
  end
end

class MatchTeam < ActiveRecord::Base
  validate :team_has_no_other_matches_in_gameweek?

  belongs_to :match
  belongs_to :team

  private

  def team_has_no_other_matches_in_gameweek?
    if team.matches.any? { |m| m.gameweek_id == match.gameweek_id }
      errors.add(:team, "already has match in gameweek")
    end
  end
end

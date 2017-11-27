class TeamsPointsAgainstQuery

  def initialize(relation = Team.all)
    @relation = relation.extending(Scopes)
  end

  def all
    @relation.select(:id)
             .select(:name)
             .select("SUM(statlines.points) AS points_against")
             .select("SUM(statlines.minutes) AS minutes_against")
             .select("SUM(statlines.points) / SUM(statlines.minutes) AS points_against_per_minute")
             .joins(match_teams: {match: :gameweek})
             .joins("JOIN match_teams AS mt2
                     ON (mt2.match_id = match_teams.match_id
                         AND mt2.side != match_teams.side)")
             .joins("JOIN statlines
                     ON statlines.match_team_id = mt2.id")
             .joins("JOIN players
                    ON players.id = statlines.player_id")
             .joins("JOIN positions
                    ON players.position_id = positions.id")
             .group(:id)
             .order("points_against_per_minute DESC")
  end

  module Scopes

    def since_gameweek(number)
      where("gameweeks.number > ?", number)
    end

    # accepts single string or array of strings (short_name, e.g. "DEF")
    def position(position)
      where(positions: { short_name: position })
    end

    def excluding_opposing_team(team_id)
      where.not(mt2: { team_id: team_id })
    end

  end

end

# raw query
# select t.id,
# 	t.name,
# 	sum(s.points) as points_against,
# 	sum(s.minutes) as minutes_against,
# 	sum(s.points) / sum(s.minutes) as points_against_per_minute
# from teams as t
# join match_teams as mt1
# on t.id = mt1.team_id
# join match_teams as mt2
# on (mt2.match_id = mt1.match_id
# 	and mt2.side != mt1.side)
# join statlines as s
# on mt2.id = s.match_team_id
# join players as p
# on s.player_id = p.id
# join positions as po
# on p.position_id = po.id
# join matches as m
# on mt2.match_id = m.id
# join gameweeks as g
# on g.id = m.gameweek_id
# where po.short_name in ("def")
# and g.number > 5
# group by t.id
# order by points_against_per_minute desc

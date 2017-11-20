class Match < ActiveRecord::Base
  belongs_to :gameweek
  has_many :match_teams
end

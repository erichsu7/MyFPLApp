class Team < ActiveRecord::Base
  has_many :match_teams
  has_many :matches, through: :match_teams
end

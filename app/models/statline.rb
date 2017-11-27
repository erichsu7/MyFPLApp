class Statline < ActiveRecord::Base
  belongs_to :player
  belongs_to :match_team
end

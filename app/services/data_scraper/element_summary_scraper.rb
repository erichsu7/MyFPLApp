class DataScraper::ElementSummaryScraper
  API_URL = "https://fantasy.premierleague.com/drf/element-summary/"

  def initialize(player_id)
    @player_id = player_id
  end

  def call
    HTTParty.get(API_URL + @player_id.to_s)
  end

end

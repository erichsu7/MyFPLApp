class Service::DataScraper::FixturesScraper
  API_URL = "https://fantasy.premierleague.com/drf/fixtures"

  def call
    HTTParty.get(API_URL)
  end

end

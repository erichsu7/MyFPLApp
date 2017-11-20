class Service::DataScraper
  API_URL = "https://fantasy.premierleague.com/drf/bootstrap-static"

  def initialize
  end

  def call
    HTTParty.get(API_URL)
  end

end

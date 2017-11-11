class Service::DataScraper
  FPL_API_URL = "https://fantasy.premierleague.com/drf/bootstrap-static"

  def initialize
  end

  def call
    HTTParty.get(FPL_API_URL)
  end

end

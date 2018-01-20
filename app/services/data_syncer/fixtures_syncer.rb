class DataSyncer::FixturesSyncer

  def call
    data = DataScraper::FixturesScraper.new.call
    DataParser::FixturesParser.new(data).call
    self
  end

end

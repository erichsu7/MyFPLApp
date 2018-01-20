class DataSyncer::ElementSummarySyncer

  def call
    Player.pluck(:id).each do |player_id|
      data = DataScraper::ElementSummaryScraper.new(player_id).call
      DataParser::ElementSummaryParser.new(player_id, data).call
    end
    self
  end

end

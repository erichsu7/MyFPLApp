class Service::AllElementSummarySyncer

  def call
    Player.pluck(:id).each do |player_id|
      data = Service::DataScraper::ElementSummaryScraper.new(player_id).call
      Service::DataParser::ElementSummaryParser.new(player_id, data).call
    end
  end

end

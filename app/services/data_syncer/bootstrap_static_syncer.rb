class DataSyncer::BootstrapStaticSyncer

  def call
    data = DataScraper::BootstrapStatic.new.call
    DataParser::BootstrapStatic.new(data).call
    self
  end

end

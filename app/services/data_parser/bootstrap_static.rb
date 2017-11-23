class DataParser::BootstrapStatic

  def initialize(data)
    @data = data
  end

  def call
    DataParser::EventsParser.new(@data["events"]).call
    DataParser::TeamsParser.new(@data["teams"]).call
    DataParser::ElementTypesParser.new(@data["element_types"]).call
    DataParser::ElementsParser.new(@data["elements"]).call
    self
  end

  private

  attr_reader :data

end

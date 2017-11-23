class Service::DataParser

  def initialize(data)
    @data = data
  end

  def call
    Service::DataParser::EventsParser.new(@data["events"]).call
    Service::DataParser::TeamsParser.new(@data["teams"]).call
    Service::DataParser::ElementTypesParser.new(@data["element_types"]).call
    self
  end

  private

  attr_reader :data

end

class DataParser::EventsParser

  def initialize(events)
    @events = events
  end

  def call
    @events.each do |event|
      gameweek = Gameweek.find_or_initialize_by(
        name: event["name"],
        number: event["id"]
      )
      gameweek.new_record? && gameweek.update(
        deadline_time: event["deadline_time"],
        deadline_time_epoch: event["deadline_time_epoch"]
      )
    end
  end

end

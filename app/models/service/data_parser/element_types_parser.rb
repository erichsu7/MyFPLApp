class Service::DataParser::ElementTypesParser

  def initialize(element_types)
    @element_types = element_types
  end

  def call
    @element_types.each do |element_type|
      position = Position.find_or_initialize_by(name: element_type["singular_name"])
      position.update(short_name: element_type["singular_name_short"])
    end
  end

end

class WeatherReport

  attr_reader :location_name, :attributes

  def initialize(location_name, attributes)
    @location_name = location_name
    @attributes    = attributes
  end

  def temperature_in_fahrenheit
    KelvinConverter.new(attributes['main']['temp']).fahrenheit
  end

  def condition_description
    main = attributes['weather'].first['main']
    desc = attributes['weather'].first['description']
    "#{main} (#{desc})"
  end

  def air_pressure
    attributes['main']['pressure']
  end

  def humidity
    attributes['main']['humidity']
  end

  def formatted_report
    [
     "#{location_name}: #{temperature_in_fahrenheit}F",
     "#{condition_description}",
     "#{air_pressure} hectopascals",
     "#{humidity}% humidity"
    ].join(', ')
  end
end

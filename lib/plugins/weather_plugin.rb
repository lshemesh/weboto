class WeatherPlugin
  include Cinch::Plugin

  match /weather/

  def execute(m)
    Rails.logger.info("Weather plugin firing")

    WEWORK_LOCATIONS.each do |location_hash|
      Rails.logger.info("Fetching weather for #{location_hash['name']}")

      report = WeatherFetcher.new(location: location_hash['name'],
                                  lat: location_hash['coordinates']['lat'],
                                  lon: location_hash['coordinates']['lon']).weather_reports.first

      m.reply report.formatted_report
    end
  end
end

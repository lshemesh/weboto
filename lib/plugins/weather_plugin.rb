class WeatherPlugin
  include Cinch::Plugin

  match /weather/

  def execute(m)
    Rails.logger.info("Weather plugin firing")

    WEWORK_LOCATIONS.each do |location, pair|
      Rails.logger.info("Fetching weather for #{location}")

      report = WeatherFether.new(location: location,
                                 lat: pair['lat'],
                                 lon: pair['lon']).weather_reports.first

      m.reply report.formatted_report
    end
  end
end

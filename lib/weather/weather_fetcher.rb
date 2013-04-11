class WeatherFetcher
  include HTTParty

  base_uri 'http://api.openweathermap.org'

  attr_reader :location, :lat, :lon

  def initialize(location: fail(ArgumentError, 'location required'),
                 lat: fail(ArgumentError, 'lat required'),
                 lon: fail(ArgumentError, 'lon required'))

    @lat      = lat
    @location = location
    @lon      = lon
  end

  def weather_reports
    response = request_for_coords(lat: lat, lon: lon)

    if 200 == response.code
      JSON.parse(response.body)['list'].map {|hash| WeatherReport.new(location, hash) }
    else
      Rails.logger.info("Failed to get weather reports for (#{[lat,lon].join(', ')})")
      []
    end
  end

  def request_for_coords(lat: fail(ArgumentError, 'lat required'), lon: fail(ArgumentError, 'lon required'))
    self.class.get('/data/2.1/find/city', :query => {
                     cnt: 3,
                     lat: lat,
                     lon: lon
                   })
  end
end

class WeatherFetcher
  include HTTParty

  base_uri 'http://api.openweathermap.org'

  attr_reader :lat, :long

  def initialize(lat: fail(ArgumentError, 'lat required'), long: fail(ArgumentError, 'long required'))
    @lat  = lat
    @long = long
  end

  def weather_reports
    response = request_for_coords(lat: lat, long: long)

    if 200 == response.code
      JSON.parse(response.body)['list'].map {|hash| WeatherReport.new(hash) }
    else
      Rails.logger.info("Failed to get weather reports for (#{[lat,long].join(', ')})")
      []
    end
  end

  def request_for_coords(lat: fail(ArgumentError, 'lat required'), long: fail(ArgumentError, 'long required'))
    self.class.get('/data/2.1/find/city', :query => {
                     cnt: 3,
                     lat: lat,
                     long: long
                   })
  end
end

require 'spec_helper'

describe WeatherReport do
  let(:location_name) { 'Winterfell' }

  let(:attributes) do
    {
      "id"=>5128581,
      "name"=>"New York",
      "coord"=>{"lon"=>-74.005966, "lat"=>40.714272},
      "distance"=>1.82,
      "main"=>
      {"temp"=>288.01,
        "humidity"=>62,
        "pressure"=>1014,
        "temp_min"=>284.82,
        "temp_max"=>289.82},
      "dt"=>1365712172,
      "wind"=>{"speed"=>4.11, "deg"=>40},
      "rain"=>{"1h"=>2.04},
      "clouds"=>{"all"=>92},
      "weather"=>
      [{"id"=>501, "main"=>"Rain", "description"=>"moderate rain", "icon"=>"10d"}]
    }
  end

  let(:weather_report) { WeatherReport.new(location_name, attributes) }

  describe '#formatted_report' do
    it 'returns a nicely-formatted weather report' do
      weather_report.formatted_report.should == "Winterfell: 59F, Rain (moderate rain), 1014 hectopascals, 62% humidity"
    end
  end

  describe '#condition_description' do
    it 'returns a condensed description of conditions' do
      weather_report.condition_description.should == 'Rain (moderate rain)'
    end
  end

  describe '#air_pressure' do
    it 'returns the atmospheric pressure in fahrenheit' do
      weather_report.air_pressure.should == 1014
    end
  end

  describe '#humidity' do
    it 'returns the humidity' do
      weather_report.humidity.should == 62
    end
  end

  describe '#temperature_in_fahrenheit' do
    it 'returns the correct temperature in degrees fahrenheit' do
      weather_report.temperature_in_fahrenheit.should == 59
    end
  end
end

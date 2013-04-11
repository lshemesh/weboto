class KelvinConverter
  attr_reader :temperature

  def initialize(temperature)
    @temperature = temperature
  end

  def fahrenheit
    ((9.0/5) * (temperature - 273) + 32).floor
  end
end

# not just using a gem because Knuckles says we should do it ourselves. xoxoxox

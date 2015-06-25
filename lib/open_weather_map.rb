#!/usr/bin/env ruby
require 'json'
require 'open-uri'

class OpenWeatherMap

  HAMBURG = 'http://api.openweathermap.org/data/2.5/weather?q=Hamburg,de'

  def current_weather
    JSON.parse(open(HAMBURG).read)
  end
end
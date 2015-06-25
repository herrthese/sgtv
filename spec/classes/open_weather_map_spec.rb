require './spec/spec_helper'
require File.join(
            File.dirname(__FILE__),
            '..',
            '..',
            'lib',
            File.basename(__FILE__).gsub(/_spec/, '')
        )

describe 'OpenWeatherMap' do
  before :each do
    stub_request(
        :get,
        OpenWeatherMap::HAMBURG
    ).with(
        :headers => {
            'Accept'          => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'      => 'Ruby'
        }
    ).to_return(
        :status => 200,
        :body => File.read(File.join(FIXTURE_PATH, 'open_weather_map_response.json')),
        :headers => {
            'Content-type'    => 'text/json'
        }
    )
  end

  context '#current_weather' do
    expected = eval(
        File.read(
            File.join(
                FIXTURE_PATH,
                'open_weather_map_valid_response.txt'
            )
        )
    )

    it 'should deliver valid parsed data' do
      result = OpenWeatherMap.new.current_weather
      expect(result).to be_a Hash
      expect(result.keys).to be == expected.keys
    end
  end

end
require 'open-uri'
require 'uri'
require 'net/http'
require 'net/https'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

FIXTURE_PATH = File.join(File.dirname(__FILE__), 'fixtures')

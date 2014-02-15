Dir.glob('spec/steps/*steps.rb') { |f| load f, true }

require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara/webkit'
require 'capybara/user_agent'
require 'rspec/autorun'
require 'turnip'
require 'turnip/capybara'

Capybara.default_driver = :webkit

module Capybara
  module Geolocation
    module DSL
      def simulate_location(latitude, longitude, accuracy=0)
        Capybara.current_session.execute_script <<-EOS
          window.navigator.geolocation = {
            getCurrentPosition: function(success){
              var position = {
                coords: {
                  latitude: #{latitude},
                  longitude: #{longitude},
                  accuracy: #{accuracy}
                }
              };
              success(position);
            }
          };
        EOS
      end
    end
  end
end

RSpec.configure do |config|
  config.include Capybara::UserAgent::DSL
  config.include Capybara::Geolocation::DSL
end

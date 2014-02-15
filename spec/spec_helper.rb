Dir.glob('spec/steps/*steps.rb') { |f| load f, true }

require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'rspec/autorun'
require 'turnip'
require 'turnip/capybara'

Capybara.register_driver :smartphone do |app|
  Capybara::Poltergeist::Driver.new(app)
end

Capybara.register_driver :docomo do |app|
  driver = Capybara::Poltergeist::Driver.new(app)
  driver.add_header('User-Agent', 'DoCoMo/2.0 P906i(c100;TB;W24H15)')
  driver
end

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
  config.include Capybara::Geolocation::DSL
end

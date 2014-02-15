Dir.glob('spec/steps/*steps.rb') { |f| load f, true }

require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara/webkit'

def simulate_location(lat, lng, accuracy=0)
  page.execute_script <<-EOS
    window.navigator.geolocation = {
      getCurrentPosition: function(success){
        var position = {coords: {latitude: #{lat}, longitude: #{lng}, accuracy: #{accuracy}}};
        success(position);
      }
    };
  EOS
end

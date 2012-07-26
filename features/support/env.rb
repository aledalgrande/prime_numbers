require 'capybara/cucumber'
require 'capybara/poltergeist'

ENV['RACK_ENV'] = 'test'

Capybara.default_driver = :poltergeist

app_file = File.join(File.dirname(__FILE__), *%w[.. .. prime_numbers.rb])
require app_file

PrimeNumbers.app_file = app_file

class MyWorld

  def app
    PrimeNumbers
  end

end

World{MyWorld.new}

Capybara.app = PrimeNumbers.new

After do |scenario|
  page.driver.render(File.join(File.dirname(__FILE__), '..', '..', 'tmp', "error_#{Time.now.to_i}.png")) if scenario.failed?
end
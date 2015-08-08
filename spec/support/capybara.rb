Capybara.default_wait_time = 60

Capybara.default_driver = :selenium
Capybara.current_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false, debug: false)
end

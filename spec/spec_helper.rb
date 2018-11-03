require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    # page.evaluate_script('jQuery.active').zero?
    true
  end
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu) }
  )
  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :headless_chrome
  config.app_host = 'http://localhost:4567'
end

Capybara.javascript_driver = :headless_chrome

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include WaitForAjax, type: :feature

  config.color = true
  config.tty = true
  config.default_formatter = 'doc'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before do
    # page.evaluate_script("window['ga-disable-UA-XXXXXXXX-X'] = true;")
  end

  config.after do
    # page.evaluate_script("window['ga-disable-UA-XXXXXXXX-X'] = true;")
  end

  config.after(:each, js: :true) { wait_for_ajax }

  config.after do |example|
    if example.exception
      width = page.evaluate_script("window.innerWidth")
      height = page.evaluate_script("document.body.scrollHeight")
      page.driver.browser.manage.window.resize_to(width, height)

      meta = example.metadata
      filename = File.basename(meta[:file_path])
      line_number = meta[:line_number]
      screenshot_name = "#{filename}-#{line_number}-#{Time.now.strftime('%Y%m%d%H%M%S%3N').to_i}.png"
      screenshot_path = "screenshot/#{screenshot_name}"
      page.save_screenshot(screenshot_path)
    end
  end
end

#!/usr/bin/env ruby
# coding: utf-8

require 'thor'
require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

BROWSER = %w[ mobile-chrome mobileEmu-chrome chrome firefox ]

class TestRunnerCLI < Thor
  package_name 'TestRunnerCLI'

  desc 'docker BROWSER SPEC_PATH', 'run SPEC_PATH in docker with BROWSER'
  method_option :browser, type: :string, enum: BROWSER, default: 'mobileEmu-chrome'
  method_option :spec_path, type: :string, default: 'spec'
  def docker
    specpath = options.spec_path
    browser = options.browser
    testrunner = TestRunner.new(browser)
    testrunner.run do
      puts "\n\n############################"
      puts "Running : #{specpath}\n"
      require  "#{__dir__}/../spec/spec_helper.rb"
      RSpec::Core::Runner.run [specpath]
      RSpec.clear_examples
    end
  end
end


class TestRunner
  def initialize(browser = 'chrome')
    @browser = browser
  end

  def run
    setup(@browser)
    yield
  end

  def setup(browser)
    puts "\n\n############################"
    puts "Starting #{browser} test run...\n"
    if browser == 'mobile-chrome'
      # ###################
      # mobile chrome selenium
      # ####################
      desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        'goog:chromeOptions': {
          args: %w[ headless disable-gpu window-size=375,2000 no-sandbox incognito disable-extensions ]
        }
      )
    elsif browser == 'mobileEmu-chrome'
      # ###################
      # mobile chrome selenium
      # ####################
      desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        'goog:chromeOptions': {
          args: %w[ headless disable-gpu window-size=375,2000 no-sandbox incognito disable-extensions ],
          mobileEmulation: { deviceName: 'iPhone 8' },
        }
      )
    elsif browser == 'chrome'
      # ###################
      # chrome selenium
      # ####################
      desired_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        'goog:chromeOptions': {
          args: %w[ headless disable-gpu window-size=1366,768 no-sandbox incognito disable-extensions ]
        }
      )
    elsif browser == 'firefox'
      # ###################
      # firefox selenium
      # ####################
      desired_capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(
        'moz:firefoxOptions': {
          args: %w[ headless window-size=1366,768 ]
        }
      )
    end

    # ###################
    # common
    # ####################
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, {
        browser: :remote,
        url: "http://#{ENV['HUB_HOST']}:#{ENV['HUB_PORT']}/wd/hub",
        desired_capabilities: desired_capabilities
      })
    end

    Capybara.configure do |config|
      config.default_max_wait_time = 5

      config.app_host = "http://#{ENV['APP_HOST']}:#{ENV['APP_PORT']}"
      config.run_server = false

      config.default_driver = :selenium
      config.javascript_driver = :selenium
    end

  end
end

TestRunnerCLI.start

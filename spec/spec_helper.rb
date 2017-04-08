# frozen_string_literal: true

require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'

require 'middleman-core'
require 'middleman-core/rack'
require 'middleman-livereload'

RSpec.configure do
  middleman_app = ::Middleman::Application.new do
    set :root, File.expand_path(File.join(File.dirname(__FILE__), '..'))
    set :environment, :development
    set :show_exceptions, false
  end

  Capybara.app = ::Middleman::Rack.new(middleman_app).to_app
  Capybara.default_driver = :poltergeist
end

# frozen_string_literal: true

notification :gntp

guard :rspec, cmd: 'bundle exec rspec' do
  # RSpec files
  watch(%r{^spec/.+_spec\.rb$})

  # spec helper
  watch('spec/spec_helper.rb') { 'spec' }

  # slim files
  watch(%r{^source/(.+)\.html\.slim$}) { |m| "spec/features/#{m[1]}_spec.rb" }

  # js files
  watch(%r{^source/js/.+\.js$}) { 'spec' }

  # scss files
  watch(%r{^source/css/.+\.scss$}) { 'spec' }
end

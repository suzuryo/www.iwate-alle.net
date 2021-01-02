# frozen_string_literal: true

notification :gntp

require 'open3'


guard :shell do

  directories %w(source lib spec test)

  watch  %r{^spec/features/.+_spec\.rb$} do |m|
    m[0] + " has changed."
    Open3.popen3("ruby ./bin/testrunner.rb docker --spec_path #{m[0]}") do |_i, o, e, _w|
      o.each { |line| puts line }
      e.each { |line| puts line }
    end
  end

  watch  %r{^source/js/.+\.js$} do |m|
    m[0] + " has changed."
    Open3.popen3("yarn run test") do |_i, o, e, _w|
      o.each { |line| puts line }
      e.each { |line| puts line }
    end
    Open3.popen3("ruby ./bin/testrunner.rb docker") do |_i, o, e, _w|
      o.each { |line| puts line }
      e.each { |line| puts line }
    end
  end

  watch  %r{^test/.+_spec\.js$} do |m|
    m[0] + " has changed."
    Open3.popen3("yarn run test") do |_i, o, e, _w|
      o.each { |line| puts line }
      e.each { |line| puts line }
    end
  end

end

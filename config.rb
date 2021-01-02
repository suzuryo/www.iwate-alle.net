# frozen_string_literal: true

require 'slim'

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'
set :slim, pretty: true, sort_attrs: true, format: :html

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :development do
  activate :livereload, host: '0.0.0.0', ignore: [
    /node_modules\//
  ]
end

activate :external_pipeline,
         name: :webpack,
         command: build? ?
                    './node_modules/.bin/webpack --bail -p --mode=production' :
                    './node_modules/.bin/webpack --watch -d --progress --color --mode=development',
         source: '.tmp/dist',
         latency: 1

configure :build do
  set :slim, pretty: false, sort_attrs: true, format: :html
  # activate :asset_hash
  activate :gzip
end

config[:host] = 'https://www.iwate-alle.net'

# Helpers
require 'lib/titled_helpers'
helpers TitledHelpers

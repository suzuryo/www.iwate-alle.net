require 'slim'

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'
set :slim, {pretty:true, sort_attrs:true, format: :html}

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :development do
  activate :livereload, host: '10.1.17.17'
end

activate :external_pipeline,
         name: :webpack,
         command: build? ? './node_modules/webpack/bin/webpack.js --bail -p' : './node_modules/webpack/bin/webpack.js --watch -d --color',
         source: '.tmp/dist',
         latency: 1

configure :build do
  set :slim, {pretty:false, sort_attrs:true, format: :html}
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :gzip
end

config[:host] = 'http://www.iwate-alle.net'

# Helpers
require 'lib/titled_helpers'
helpers TitledHelpers

require 'slim'

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'
set :slim, {pretty:true, sort_attrs:true, format: :html}

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :development do
  activate :livereload
end

activate :external_pipeline,
         name: :webpack,
         command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
         source: '.tmp/dist',
         latency: 1

configure :build do
  set :slim, {pretty:false, sort_attrs:true, format: :html}
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :gzip
end

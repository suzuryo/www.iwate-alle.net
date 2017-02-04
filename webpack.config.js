const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

const config = {
  entry: {
    'js/bundle.js': './source/js/bundle.js',
    'css/styles.css': './source/css/_styles.scss',
  },

  resolve: {
    root: path.join(__dirname, 'source/js'),
  },

  output: {
    path: path.join(__dirname, '.tmp/dist'),
    filename: '[name]',
  },

  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components|\.tmp|vendor)/,
        loader: 'babel',
        query: {
          presets: ['es2015'],
        },
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract('style', `css!sass?sourceMap&includePaths[]=${path.join(__dirname, '/node_modules')}`),
      },
    ],
  },

  plugins: [
    new ExtractTextPlugin('css/styles.css'),
  ],
};

module.exports = config;

const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const config = {
  entry: {
    'js/bundle': './source/js/bundle.js',
    'css/styles': './source/css/_styles.scss',
  },

  resolve: {
    modules: [
      path.resolve(__dirname, 'source/js'),
      'node_modules',
    ],
  },

  output: {
    path: path.resolve(__dirname, '.tmp/dist'),
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components|\.tmp|vendor)/,
        use: ['babel-loader'],
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader',
        ],
      },
    ],
  },

  plugins: [
    new MiniCssExtractPlugin(),
  ],
};

module.exports = config;

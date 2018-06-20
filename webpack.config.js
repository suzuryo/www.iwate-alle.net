const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const config = {
  entry: {
    'js/bundle.js': './source/js/bundle.js',
    'css/styles.css': './source/css/_styles.scss',
  },

  resolve: {
    modules: [
      path.resolve(__dirname, 'source/js'),
      'node_modules',
    ],
  },

  output: {
    path: path.resolve(__dirname, '.tmp/dist'),
    filename: '[name]',
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
        use: MiniCssExtractPlugin.loader({
          fallback: 'style-loader',
          use: [
            'css-loader',
            'sass-loader',
          ],
        }),
      },
    ],
  },

  plugins: [
    new MiniCssExtractPlugin({
      filename: 'css/styles.css',
    }),
  ],
};

module.exports = config;

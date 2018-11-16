const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

const config = {
  entry: {
    'js/bundle': './source/js/bundle.js',
    'css/styles': './source/css/_styles.scss',
  },

  devtool: 'source-map',

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
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
          },
        },
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader',
            options: {
              url: false,
              minimize: true,
              sourceMap: true,
            },
          },
          {
            loader: 'postcss-loader',
            options: {
              sourceMap: true,
              plugins: [
                require('autoprefixer')({
                  grid: true,
                }),
              ],
            },
          },
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

const path = require('path');

const config = {
  entry: {
    bundle: './source/js/bundle.js',
  },

  resolve: {
    root: path.join(__dirname, 'source/js'),
    modulesDirectories: [
      path.join(__dirname, 'node_modules'),
      path.join(__dirname, 'source/css'),
    ],
    extensions: ['', '.js', '.scss'],
  },

  output: {
    path: path.join(__dirname, '.tmp/dist'),
    filename: 'js/[name].js',
  },

  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel',
        query: {
          presets: ['es2015'],
        },
      },
      {
        test: /\.scss$/,
        loaders: ['style', 'css?sourceMap', 'sass?sourceMap'],
      },
      {
        test: /\.css$/,
        loaders: ['style', 'css'],
      },
      {
        test: /\.png$/,
        loader: 'url-loader?mimetype=image/png',
      },
    ],
  },
};

module.exports = config;

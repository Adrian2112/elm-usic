var path = require('path');
var webpack = require('webpack');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  devtool: 'eval',
  watch: true,
  entry: [
    'webpack-dev-server/client?http://localhost:4444',
    './app/index.js'
  ],
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    publicPath: '/static/'
  },
  plugins: [
    new ExtractTextPlugin("style.css" /*,{ allChunks: true}*/ ) // Uncoment to create a style.css file
  ],
  resolve: {
    extensions: ['', '.js', '.elm'],
      
    // root: [path.join(__dirname, "bower_components")],
    // modulesDirectories: ['node_modules', 'bower_components'],
    alias: {
      partials:      path.join(__dirname, "/app/views/partials"),
      views:         path.join(__dirname, "/app/views"),
      modules:       path.join(__dirname, "/app/modules"),
      elm:           path.join(__dirname, "/app/elm"), 
      styles:        path.join(__dirname, "/styles")
    }
  },
  module: {
    loaders: [
      // {test: /\.elm$/,    loader: 'expose?Elm!exports?Elm!ulmus?output=tmp/[name].js', exclude: [/node_modules/]},
      {test: /\.elm$/, loader: 'elm-simple-loader', exclude: [/elm-stuff/, /node_modules/]},
      {test: /\.less$/,   loaders: ['style', 'css', 'less']}
    ],
    noParse: /\.elm$/
  },

};

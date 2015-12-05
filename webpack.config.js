var path = require('path');
var webpack = require('webpack');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {
  devtool: 'eval',
  entry: [
    'webpack-dev-server/client?http://localhost:3333',
    'webpack/hot/dev-server',
    './app/index'
  ],
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    publicPath: '/static/'
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.DefinePlugin({
            'process.env.NODE_ENV': JSON.stringify('development')
          }),
    new ExtractTextPlugin("style.css" /*,{ allChunks: true}*/ ) // Uncoment to create a style.css file
  ],
  resolve: {
    root: [path.join(__dirname, "bower_components")],
    modulesDirectories: ['node_modules', 'bower_components'],
    alias: {
      components:    path.join(__dirname, "/app/components"),
      partials:      path.join(__dirname, "/app/views/partials"),
      views:         path.join(__dirname, "/app/views"),
      modules:       path.join(__dirname, "/app/modules"),
      styles:        path.join(__dirname, "/styles")
    }
  },
  module: {
    loaders: [
      {test: /\.jsx?$/,   loaders: ['react-hot', 'babel'],    include: path.join(__dirname, 'app')},
      {test: /\.less$/,   loaders: ['style', 'css', 'autoprefixer', 'less']}
      // {test: /\.less$/,   loaders: ['style', 'css', 'less']}

      // Uncoment to create a style.css file
      // {test: /\.css$/,    loader: ExtractTextPlugin.extract("style-loader", "css-loader")},
      // {test: /\.less$/,   loader: ExtractTextPlugin.extract("style-loader", "css-loader!less-loader")},
    ]
  }
};

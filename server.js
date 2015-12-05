var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
var config = require('./webpack.config');
var path = require('path');

var port = 4444;

var server = new WebpackDevServer(webpack(config), {
  publicPath: config.output.publicPath
});

// Important part. Send down index.html for all requests
// server.use('/', function(req, res) {
//   res.sendFile(path.join(__dirname+'/index.html'));
// });

server.listen(port, 'localhost', function (err, result) {
  if (err) {
    console.log(err);
  }

  console.log('Listening at localhost:' + port);
});

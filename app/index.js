// var Rx = require('rx');

// bring in our Elm application through webpack!
var Elm = require('elm/App.elm');

var styles = require('styles/main.less');

function init() {
  var elmApp = Elm.embed(Elm.App, document.getElementById('elm-app'));
}

init();

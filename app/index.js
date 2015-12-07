// Bring in our Elm application through webpack!
var Elm = require('elm/App.elm');
var styles = require('styles/main.less');

Elm.embed(Elm.App, document.getElementById('elm-app'));

(function(window) {
  var Elm = window.Elm;
  //Elm.embed(Elm.App, document.getElementById('elm-app'));
  window.Elmusic = Elm.fullscreen(Elm.App, { songFinished: '' });
})(window);


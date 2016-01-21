module App where
import StartApp

import ELMusic exposing (init, update, view)
import Html exposing (text)

app =
  StartApp.start
    {
      init = init,
      update = update,
      view = view,
      inputs = [events]
    }

main =
  app.html

events =
    Signal.map (always ELMusic.SongFinished) songFinished

port songFinished : Signal String

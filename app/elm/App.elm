module App where
import StartApp.Simple exposing (start)

import ELMusic exposing (init, update, view)
import Html exposing (text)

main =
  start
    {
      model = init,
      update = update,
      view = view
    }

module ELMusic where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Song

-- Model
type alias Model =
  {
    visualizer : Int,
    songs : List Song.Model
  }

init : Model
init =
    { visualizer = 0,
    songs = [
      Song.init "https://www.youtube.com/embed/U6vp1EMnqho" "Neil Young",
      Song.init "https://www.youtube.com/embed/j9Dr1anRP9w" "Concierto pa george"]
    }

-- Update
type Action = NoOp

update : Action -> Model -> Model
update action model =
  model


-- View
view : Signal.Address Action -> Model -> Html
view action model =
  div [ id "prototype" ]
    [
      div [ class "list" ]
        (List.map Song.view model.songs)
    ]

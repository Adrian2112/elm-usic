module ELMusic where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Song
import Visualizer

-- Model
type alias Model =
  {
    visualizer : Visualizer.Model,
    songs : List Song.Model
  }

init : Model
init =
    { visualizer = Visualizer.init "",
    songs = [
      Song.init "https://www.youtube.com/embed/U6vp1EMnqho" "Neil Young",
      Song.init "https://www.youtube.com/embed/j9Dr1anRP9w" "Concierto pa george"]
    }

-- Update
type Action = SelectSong String

update : Action -> Model -> Model
update action model =
  case action of
    SelectSong url->
      { model | visualizer = Visualizer.init url }


-- View
view : Signal.Address Action -> Model -> Html
view address model =
  div [ id "prototype" ]
    [
      (Visualizer.view model.visualizer),
      div [ class "list" ]
        (List.map (\song -> Song.view (Signal.forwardTo address (always (SelectSong (.url song)))) song) model.songs)
    ]

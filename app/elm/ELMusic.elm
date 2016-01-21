module ELMusic where

import Array exposing (Array)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Song
import Visualizer

-- Model
type alias Model =
  {
    visualizer : Visualizer.Model,
    songs : Array Song.Model,
    nextID : Int
  }

init : Model
init =
    { visualizer = Visualizer.init Nothing,
      songs = Array.fromList [
        Song.init "https://www.youtube.com/embed/U6vp1EMnqho" "Neil Young",
        Song.init "https://www.youtube.com/embed/j9Dr1anRP9w" "Concierto pa george"
        ],
      nextID = 1
     }

-- Update
type Action
  = SelectSong Song.Model
    | SongFinished

update : Action -> Model -> Model
update action model =
  case action of
    SelectSong song ->
      { model | visualizer = Visualizer.init (Just song) }
    SongFinished ->
      {
        model |
          visualizer = Visualizer.init (Array.get model.nextID model.songs),
          nextID = model.nextID + 1
      }


-- View
view : Signal.Address Action -> Model -> Html
view address model =
  div [ id "prototype" ]
    [
      (Visualizer.view model.visualizer),
      div [ class "list" ]
        (List.map (\song -> Song.view (Signal.forwardTo address (always (SelectSong song))) song) (Array.toList model.songs))
    ]

module ELMusic where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model =
  {
    visualizer : Int,
    songs : List Int
  }

-- Model
init : Model
init =
    { visualizer = 0, songs = [] }

-- Update
type Action = NoOp

update : Action -> Model -> Model
update action model =
  model


-- View
view : Signal.Address Action -> Model -> Html
view action model =
  div [] [ text "Hola 8" ]

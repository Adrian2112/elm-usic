module Visualizer (Model, init, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- Model
type alias Model = 
  {
    url : String
  }

init : String -> Model
init url =
    { url = url }

-- Update
type Action = NoOp

update : Action -> Model -> Model
update action model =
  model

-- View
view : Model -> Html
view model =
  div [ class "visualizer" ]
    [
      div [class "status"] [ text "Now Playing" ],
      div [class "metadata"] [ text model.url ]
    ]

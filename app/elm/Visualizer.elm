module Visualizer (Model, init, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Encode as Json
import String exposing (append)

-- Model
type alias Model =
  {
    url : Maybe String
  }

init : Maybe String -> Model
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
      player model
    ]

player : Model -> Html
player model =
  case model.url of
    Just url ->
      iframe [src (append url "?autoplay=1"), width 390, height 200, property "frameBorder" (Json.string "0") ] []
    Nothing ->
      div [] []



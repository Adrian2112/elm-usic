module Visualizer (Model, init, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Encode as Json
import String exposing (append)

import Song

-- Model
type alias Model =
  {
    song : Maybe Song.Model
  }

init : Maybe Song.Model -> Model
init song =
    { song = song }

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
  case model.song of
    Just song ->
      iframe [src (append song.url "?autoplay=1"), width 390, height 200, property "frameBorder" (Json.string "0") ] []
    Nothing ->
      div [] []



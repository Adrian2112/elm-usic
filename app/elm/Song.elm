module Song (Model, init, update, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- Model
type alias Model =
  {
    url : String,
    name : String
  }

init : String -> String -> Model
init url name =
    { url = url, name = name }

-- Update
type Action = NoOp

update : Action -> Model -> Model
update action model =
  model


-- View
view : Signal.Address Action -> Model -> Html
view address model =
  div [onClick address NoOp, class "song"]
    [
      div [ class "avatar" ] [],
      div [class "name"] [ text model.name ],
      div [class "metadata"] [ text model.url ]
    ]

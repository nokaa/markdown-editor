import Html exposing (Html, Attribute, div, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Markdown

main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { content : String
  }

model : Model
model =
  { content = "" }


-- UPDATE

type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ textarea [ placeholder "Enter your markdown!", onInput Change ] []
    , div [] [ Markdown.toHtml [] model.content ]
    ]

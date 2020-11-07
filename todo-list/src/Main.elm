module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)


---- MODEL ----


type alias Model =
    (List Todo)



type alias Todo = 
    { completed : Bool
    , title : String
    }


init : ( Model, Cmd Msg )
init =
    ( [] , Cmd.none )



---- UPDATE ----


type Msg
    = AddTodo Todo


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddTodo newTodo ->
            ( model ++ [ newTodo ], Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }

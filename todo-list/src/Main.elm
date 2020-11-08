module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    List Todo


type alias Todo =
    { completed : Bool
    , title : String
    , id : Int
    }


initialTodoList : List Todo
initialTodoList =
    [ { id = 1, completed = False, title = "Do the laundry" }, { id = 2, completed = True, title = "Be sad" } ]


init : ( Model, Cmd Msg )
init =
    ( initialTodoList, Cmd.none )



---- UPDATE ----


type Msg
    = AddTodo Todo
    | RemoveTodo Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddTodo newTodo ->
            ( newTodo :: model, Cmd.none )

        RemoveTodo id ->
            ( List.filter (\todo -> todo.id /= id) model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick <| AddTodo { id = 3, completed = False, title = "Do dishes" } ] [ text "Add Todo" ]
        , button [ onClick <| RemoveTodo 3 ] [ text "Remove Todo" ]
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

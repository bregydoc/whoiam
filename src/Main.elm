module Main exposing (..)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Owl exposing (viewDefaultOwl)



-- Theme information


mainFont : List String
mainFont =
    [ "PT Mono", "monospace" ]


primaryColor : String
primaryColor =
    "#50f2d5"


bgColor : String
bgColor =
    "#000000"



---- MODEL ----


type alias Model =
    String


init : ( Model, Cmd Msg )
init =
    ( "Hello World", Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view _ =
    div
        [ css
            [ displayFlex
            , padding2 (rem 2) (rem 4)
            , backgroundColor (hex bgColor)
            , margin zero
            , height (vh 100)
            , color (hex primaryColor)
            ]
        ]
        [ text "Hello World"
        , viewDefaultOwl primaryColor
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view >> toUnstyled
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }

module Main exposing (..)

import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Theming.Light exposing (light)



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
view model =
    div
        [ css [ backgroundColor (hex light.colors.primary), margin zero, padding (px 10) ] ]
        [ h1 [ css [ fontFamilies (String.split "," light.fonts.title) ] ] [ text model ]
        , h2 [ css [ fontFamilies (String.split "," light.fonts.mono) ] ] [ text model ]
        , p [ css [ fontFamilies (String.split "," light.fonts.body) ] ] [ text model ]
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

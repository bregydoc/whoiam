module Main exposing (Link(..), Msg(..), Page(..), main)

import Battery exposing (viewBattery)
import Browser
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Life exposing (lifePercent)
import Owl exposing (viewDefaultOwl)
import Round
import StatusTime exposing (timeToDate, timeToStr)
import Task
import Theme exposing (bgColor, mainFonts, primaryColor, secondaryColor)
import Time exposing (Month(..), millisToPosix, utc)
import Time.Extra as Time



-- HELPERS
---- MODEL ----


type Page
    = AboutMe
    | MyInterests
    | MyWork


type alias Model =
    { currentPage : Page
    , timeZone : Time.Zone
    , time : Time.Posix
    , body : String
    }


init : ( Model, Cmd Msg )
init =
    ( { currentPage = AboutMe
      , timeZone = utc
      , time = millisToPosix 0
      , body = "Hello World"
      }
    , Task.perform AdjustTimeZone Time.here
    )



---- UPDATE ----


type Link
    = Email String
    | Github String
    | LinkedIn String
    | Phone String


type Msg
    = ChangePage Page
    | LoadPage
    | OpenLink Link
    | ClockTick Time.Posix
    | AdjustTimeZone Time.Zone


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangePage page ->
            ( { model | currentPage = page }, Cmd.none )

        LoadPage ->
            ( { model | body = "ijiji" }, Cmd.none )

        OpenLink _ ->
            ( model, Cmd.none )

        AdjustTimeZone zone ->
            ( { model | timeZone = zone }, Cmd.none )

        ClockTick time ->
            ( { model | time = time }, Cmd.none )


viewStatusBar : Model -> Html Msg
viewStatusBar model =
    if model.time == millisToPosix 0 then
        div [] []

    else
        div
            [ css
                [ displayFlex
                , fontFamilies mainFonts
                , alignItems center

                -- , align center
                ]
            ]
            [ text <| Round.round 2 <| lifePercent model.timeZone model.time * 100
            , div
                [ css
                    [ marginLeft (rem 0.5)
                    , marginRight (rem 0.5)
                    , alignItems center
                    , paddingTop (rem 0.1)
                    ]
                ]
                [ viewBattery ]
            , text " | "
            , text <| timeToDate model.timeZone model.time -- "Tue Apr 7"
            , text " | "
            , text <| timeToStr model.timeZone model.time
            ]


viewHead : Model -> Html Msg
viewHead model =
    div
        [ css
            [ fontFamilies mainFonts
            ]
        ]
        [ div []
            [ h2
                [ css
                    [ fontSize (rem 3)
                    , margin4 (rem 3) zero zero zero
                    , fontWeight normal
                    , opacity (num 0.52)
                    ]
                ]
                [ text "Hello," ]
            , div
                [ css
                    [ displayFlex
                    , margin4 (rem 0.6) zero (rem 1.4) zero
                    ]
                ]
                [ div
                    [ css
                        [ fontSize (rem 3)
                        , fontWeight normal
                        , opacity (num 0.52)
                        ]
                    ]
                    [ text "I'm" ]
                , h1
                    [ css
                        [ marginTop zero
                        , marginBottom zero
                        , marginLeft (rem 2)
                        , fontSize (rem 3)
                        , fontWeight normal
                        , opacity (num 0.52)
                        , fontWeight bold
                        , opacity (num 1)
                        ]
                    ]
                    [ text "Bregy Malpartida" ]
                ]
            , div
                [ css
                    [ fontSize (rem 1)
                    , color (hex secondaryColor)
                    , opacity (num 0.64)
                    ]
                ]
                [ h3 []
                    [ text "Passionate about human knowledge"
                    ]
                ]
            ]
        ]



---- VIEW ----


view : Model -> Html Msg
view model =
    div
        [ css
            [ padding2 (rem 2) (rem 4)
            , backgroundColor (hex bgColor)
            , margin zero
            , color (hex primaryColor)
            ]
        ]
        [ viewStatusBar model
        , viewHead model

        -- , viewDefaultOwl primaryColor
        ]



---- SUSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions _ =
    Time.every 1000 ClockTick



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view >> toUnstyled
        , init = \_ -> init
        , update = update
        , subscriptions = subscriptions
        }

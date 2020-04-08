module Main exposing (Link(..), Msg(..), Page(..), main)

import Battery exposing (viewBattery)
import Browser
import Content.About exposing (aboutBody)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Head exposing (headNameAndTag, viewHead)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Life exposing (lifePercent)
import Owl exposing (viewDefaultOwl)
import Round
import StatusTime exposing (timeToDate, timeToStr)
import Task
import Theme exposing (bgColor, mainFonts, primaryColor)
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
    }


init : ( Model, Cmd Msg )
init =
    ( { currentPage = AboutMe
      , timeZone = utc
      , time = millisToPosix 0
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
    | OpenLink Link
    | ClockTick Time.Posix
    | AdjustTimeZone Time.Zone


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangePage page ->
            ( { model | currentPage = page }, Cmd.none )

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
            [ text ((Round.round 2 <| lifePercent model.timeZone model.time * 100) ++ "%")
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


viewBox : Model -> Html Msg
viewBox model =
    div
        [ css
            [ border3 (px 1.5) solid (hex primaryColor)
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , fontFamilies mainFonts
                , margin2 zero zero
                ]
            ]
            [ div [ css [ marginLeft (rem 2) ] ] [ viewOptionBox "About Me" AboutMe model ]
            , div [ css [ margin2 zero (rem 2) ] ] [ viewOptionBox "My Interests" MyInterests model ]
            , viewOptionBox "My Work" MyWork model
            ]
        , div
            [ css
                [ padding (rem 2)
                , fontFamilies mainFonts
                ]
            ]
            [ viewBodyBox model
            ]
        ]


viewBodyBox : Model -> Html Msg
viewBodyBox model =
    div []
        [ case model.currentPage of
            AboutMe ->
                div
                    [ css [ displayFlex ]
                    ]
                    [ div
                        [ css
                            [ flexGrow (num 1)
                            , paddingRight (rem 1)
                            , lineHeight (rem 2)
                            ]
                        ]
                        [ text aboutBody ]
                    , div []
                        [ viewDefaultOwl primaryColor ]
                    ]

            MyInterests ->
                text "here will be my interests"

            MyWork ->
                text "here will be my works"
        ]


viewOptionBox : String -> Page -> Model -> Html Msg
viewOptionBox title page model =
    div
        [ css
            [ color <|
                if model.currentPage == page then
                    hex bgColor

                else
                    hex primaryColor
            , padding2 (rem 0.6) (rem 0.8)
            , backgroundColor <|
                if model.currentPage == page then
                    hex primaryColor

                else
                    hex bgColor
            , transforms [ translateY (rem -1.2), translateX (rem -0.121) ]
            , hover
                [ cursor pointer
                , backgroundColor (hex primaryColor)
                , color (hex bgColor)
                ]
            , transition
                [ Css.Transitions.backgroundColor 333
                ]
            ]
        , onClick <| ChangePage page
        ]
        [ text title ]



---- VIEW ----


view : Model -> Html Msg
view model =
    div
        [ css
            [ minHeight (vh 100)
            , backgroundColor (hex bgColor)
            ]
        ]
        [ div
            [ css
                [ padding2 (rem 2) (rem 4)
                , margin zero
                , color (hex primaryColor)
                ]
            ]
            [ viewStatusBar model
            , viewHead <| headNameAndTag "Bregy Malpartida" "Passionate about human knowledge"
            , viewBox model

            -- , viewDefaultOwl primaryColor
            ]
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

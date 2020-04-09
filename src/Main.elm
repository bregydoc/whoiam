module Main exposing (main)

import Browser
import Browser.Navigation as Navigator
import Content.About exposing (aboutBody)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Head exposing (headNameAndTag, viewHead)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Link exposing (Link, viewSocialLink)
import Owl exposing (viewDefaultOwl)
import Page exposing (Page, renderOptionPage, renderPage)
import StatusBar exposing (renderStatusBar)
import Task
import Theme exposing (bgColor, mainFonts, primaryColor)
import Time exposing (Month(..), millisToPosix, utc)



-- HELPERS
---- MODEL ----


type alias Model =
    { currentPage : Page
    , timeZone : Time.Zone
    , time : Time.Posix
    }


init : ( Model, Cmd Msg )
init =
    ( { currentPage = Page.AboutMe
      , timeZone = utc
      , time = millisToPosix 0
      }
    , Task.perform AdjustTimeZone Time.here
    )



---- UPDATE ----


type Msg
    = ChangePage Page
    | OpenLink String
    | ClockTick Time.Posix
    | AdjustTimeZone Time.Zone
    | OpenSettings


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangePage page ->
            ( { model | currentPage = page }, Cmd.none )

        OpenLink link ->
            ( model, Navigator.load link )

        AdjustTimeZone zone ->
            ( { model | timeZone = zone }, Cmd.none )

        ClockTick time ->
            ( { model | time = time }, Cmd.none )

        OpenSettings ->
            ( model, Cmd.none )


viewBox : Model -> Html Msg
viewBox model =
    div
        [ css
            [ border3 (px 1.0) solid (hex primaryColor)
            , transition
                [ Css.Transitions.height 333
                ]
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , fontFamilies mainFonts
                , margin2 zero zero
                ]
            ]
            [ div
                [ css
                    [ marginLeft (rem 2)
                    ]
                ]
                [ ChangePage Page.AboutMe
                    |> renderOptionPage "About Me" model.currentPage Page.AboutMe
                ]
            , div
                [ css
                    [ margin2 zero (rem 2)
                    ]
                ]
                [ ChangePage Page.MyInterests
                    |> renderOptionPage "My Interests" model.currentPage Page.MyInterests
                ]
            , div
                [ css []
                ]
                [ ChangePage Page.MyInterests
                    |> renderOptionPage "My Work" model.currentPage Page.MyWork
                ]
            ]
        , div
            [ css
                [ padding (rem 2)
                , fontFamilies mainFonts
                ]
            ]
            [ renderPage model.currentPage
            ]
        ]


renderSocialNetworks : Html Msg
renderSocialNetworks =
    div
        [ css
            [ displayFlex
            , flexFlow1 column
            , alignItems flexEnd
            , marginTop (rem 3)
            ]
        ]
        [ OpenLink "mailto:bregy.malpartida@utec.edu.pe"
            |> viewSocialLink (Link.Email "bregy.malpartida@utec.edu.pe")
        , OpenLink "https://github.com/bregydoc"
            |> viewSocialLink (Link.Github "github.com/bregydoc")
        , OpenLink "https://linkedin.com/in/bregy"
            |> viewSocialLink (Link.LinkedIn "linkedin/bregy")
        , OpenLink "phone:+51957821858"
            |> viewSocialLink (Link.Phone "+51957821858")
        ]



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
            [ OpenSettings |> renderStatusBar model.timeZone model.time
            , div
                [ css
                    [ displayFlex
                    , justifyContent spaceBetween
                    ]
                ]
                [ viewHead <| headNameAndTag "Bregy Malpartida" "Passionate about human knowledge"
                , div []
                    [ renderSocialNetworks ]
                ]
            , viewBox model
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

module Main exposing (main)

import Browser
import Browser.Navigation as Navigator
import Css exposing (..)
import Head exposing (headNameAndTag, viewHead)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Link exposing (Link, viewSocialLink)
import Page exposing (Page, renderPages)
import Settings exposing (LangSetting, ThemeSetting, renderModal)
import StatusBar exposing (renderStatusBar)
import Task
import Theme exposing (Theme, bgColor, mainFonts, primaryColor)
import Time exposing (Month(..), millisToPosix, utc)



---- MODEL ----


type alias Model =
    { currentPage : Page
    , timeZone : Time.Zone
    , time : Time.Posix
    , settingsModal : Bool
    , currentTheme : ThemeSetting
    , currentLang : LangSetting
    }


init : ( Model, Cmd Msg )
init =
    ( { currentPage = Page.AboutMe
      , timeZone = utc
      , time = millisToPosix 0
      , settingsModal = False
      , currentTheme = Settings.Dark
      , currentLang = Settings.EN
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
    | CloseSettings
    | SetTheme Settings.ThemeSetting
    | SetLanguage Settings.LangSetting


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
            ( { model | settingsModal = True }, Cmd.none )

        CloseSettings ->
            ( { model | settingsModal = False }, Cmd.none )

        SetTheme theme ->
            ( { model | currentTheme = theme }, Cmd.none )

        SetLanguage lang ->
            ( { model | currentLang = lang }, Cmd.none )


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
        [ if model.settingsModal then
            renderModal
                { close = CloseSettings
                , options =
                    [ ( Settings.Theme Settings.Dark, SetTheme Settings.Dark )
                    , ( Settings.Language Settings.EN, SetLanguage Settings.EN )
                    ]
                }

          else
            div [] []
        , div
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
            , renderPages model.currentPage
                [ ( Page.AboutMe, ChangePage Page.AboutMe )
                , ( Page.MyInterests, ChangePage Page.MyInterests )
                , ( Page.MyWork, ChangePage Page.MyWork )
                ]
            ]
        ]



---- SUBSCRIPTIONS ----


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

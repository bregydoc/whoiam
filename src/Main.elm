module Main exposing (main)

import Browser
import Browser.Dom exposing (getViewport)
import Browser.Events exposing (onResize)
import Browser.Navigation as Navigator
import Css exposing (..)
import Head exposing (headNameAndTag, viewHead)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Link exposing (Link, renderSocialLink)
import Page exposing (Page, renderPages)
import Settings.Languages exposing (LangSetting)
import Settings.Settings exposing (Settings, renderSettingsModal)
import Settings.Themes exposing (ThemeSetting)
import StatusBar exposing (renderStatusBar)
import Task
import Theme exposing (Theme, darkTheme, getScreenSize)
import Time exposing (Month(..), millisToPosix, utc)



---- MODEL ----


type alias Model =
    { currentPage : Page
    , timeZone : Time.Zone
    , time : Time.Posix
    , settingsModal : Bool
    , settings : Settings
    , theme : Theme
    }


init : ( Model, Cmd Msg )
init =
    ( { currentPage = Page.AboutMe
      , timeZone = utc
      , time = millisToPosix 0
      , settingsModal = False
      , settings =
            { language = Settings.Languages.EN
            , theme = Settings.Themes.Dark
            }
      , theme = darkTheme
      }
    , Task.perform PerformStart getViewport
      --, Task.perform AdjustTimeZone Time.here
      --|> Task.andThen ()
    )



---- UPDATE ----


type Msg
    = ChangePage Page
    | OpenLink String
    | ClockTick Time.Posix
    | AdjustTimeZone Time.Zone
    | OpenSettings
    | CloseSettings
    | ChangeSettings Settings
    | PerformStart Browser.Dom.Viewport
    | ChangeWindowWidth Int
    | AdjustWindowWidth Browser.Dom.Viewport



--| UpdateTheme
--| UpdateLanguage


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

        ChangeSettings newSettings ->
            let
                t =
                    model.theme

                newTheme =
                    case newSettings.theme of
                        Settings.Themes.Dark ->
                            Theme.darkTheme

                        Settings.Themes.Light ->
                            Theme.lightTheme

                finalTheme =
                    { newTheme | device = t.device }
            in
            ( { model | settings = newSettings, theme = finalTheme }, Cmd.none )

        PerformStart viewport ->
            let
                t =
                    model.theme

                newTheme =
                    { t | device = getScreenSize <| Basics.round viewport.viewport.width }
            in
            ( { model | theme = newTheme }, Task.perform AdjustTimeZone Time.here )

        ChangeWindowWidth width ->
            let
                t =
                    model.theme

                newTheme =
                    { t | device = getScreenSize width }
            in
            ( { model | theme = newTheme }, Cmd.none )

        AdjustWindowWidth viewport ->
            let
                t =
                    model.theme

                newTheme =
                    { t | device = getScreenSize <| Basics.round viewport.viewport.width }
            in
            ( { model | theme = newTheme }, Cmd.none )



--UpdateTheme ->
--
--UpdateLanguage  ->


renderSocialNetworks : Theme -> Html Msg
renderSocialNetworks theme =
    div
        [ css
            [ displayFlex
            , flexFlow1 column
            , alignItems flexEnd
            , marginTop (rem 3)
            ]
        ]
        [ OpenLink "mailto:bregy.malpartida@utec.edu.pe"
            |> renderSocialLink theme (Link.Email "bregy.malpartida@utec.edu.pe")
        , OpenLink "https://github.com/bregydoc"
            |> renderSocialLink theme (Link.Github "github.com/bregydoc")
        , OpenLink "https://linkedin.com/in/bregy"
            |> renderSocialLink theme (Link.LinkedIn "linkedin/bregy")
        , OpenLink "phone:+51957821858"
            |> renderSocialLink theme (Link.Phone "+51957821858")
        ]


themeSelector : Model -> ThemeSetting -> Msg
themeSelector model theme =
    case theme of
        Settings.Themes.Light ->
            let
                currentSettings =
                    model.settings

                newSettings =
                    { currentSettings | theme = Settings.Themes.Light }
            in
            ChangeSettings newSettings

        Settings.Themes.Dark ->
            let
                currentSettings =
                    model.settings

                newSettings =
                    { currentSettings | theme = Settings.Themes.Dark }
            in
            ChangeSettings newSettings


languageSelector : Model -> LangSetting -> Msg
languageSelector model theme =
    case theme of
        Settings.Languages.EN ->
            let
                currentSettings =
                    model.settings

                newSettings =
                    { currentSettings | language = Settings.Languages.EN }
            in
            ChangeSettings newSettings

        Settings.Languages.ES ->
            let
                currentSettings =
                    model.settings

                newSettings =
                    { currentSettings | language = Settings.Languages.ES }
            in
            ChangeSettings newSettings


pageUpdater : Page -> Msg
pageUpdater page =
    case page of
        Page.AboutMe ->
            ChangePage Page.AboutMe

        Page.MyInterests ->
            ChangePage Page.MyInterests

        Page.MyWork workType ->
            ChangePage <| Page.MyWork workType

        Page.Minsky ->
            ChangePage Page.Minsky



---- VIEW ----


view : Model -> Html Msg
view model =
    div
        [ css
            [ minHeight (vh 100)
            , backgroundColor (hex model.theme.bgColor)
            ]
        ]
        [ if model.settingsModal then
            renderSettingsModal
                model.theme
                { close = CloseSettings
                , current = model.settings
                , themeSelector = themeSelector model
                , languageSelector = languageSelector model
                }

          else
            div [] []
        , div
            [ css
                [ padding2 (rem 2) (rem 4)
                , margin zero
                , color (hex model.theme.primaryColor)
                ]
            ]
            [ OpenSettings |> renderStatusBar model.theme model.timeZone model.time
            , div
                [ css
                    [ displayFlex
                    , justifyContent spaceBetween
                    ]
                ]
                [ viewHead model.theme <| headNameAndTag "Bregy Malpartida" "Passionate about human knowledge"
                , div []
                    [ renderSocialNetworks model.theme ]
                ]
            , renderPages model.theme model.currentPage pageUpdater
            ]
        ]



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Time.every 1000 ClockTick
        , onResize (\w -> \_ -> ChangeWindowWidth w)
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view >> toUnstyled
        , init = \_ -> init
        , update = update
        , subscriptions = subscriptions
        }

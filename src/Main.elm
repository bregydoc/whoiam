module Main exposing (main)

import Browser
import Browser.Dom exposing (getViewport)
import Browser.Events exposing (onResize)
import Css exposing (..)
import Head exposing (renderHead)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Page exposing (Page, renderPages)
import Ports exposing (StoreSettings, saveSettings)
import Settings.Languages exposing (LangSetting)
import Settings.Settings exposing (Settings, renderSettingsModal)
import Settings.Themes exposing (ThemeSetting)
import SocialNetworks exposing (renderSocialNetworks)
import StatusBar exposing (renderStatusBar)
import Task
import TextResource exposing (Language(..))
import Theme exposing (Theme, darkTheme, getScreenSize)
import Time exposing (Month(..), millisToPosix, utc)



-- HELPERS --


corpusLang : Model -> TextResource.Language
corpusLang model =
    case model.settings.language of
        Settings.Languages.EN ->
            TextResource.EN

        Settings.Languages.ES ->
            TextResource.ES


settingsToSave : Settings -> StoreSettings
settingsToSave settings =
    let
        lang =
            case settings.language of
                Settings.Languages.EN ->
                    "EN"

                Settings.Languages.ES ->
                    "ES"

        theme =
            case settings.theme of
                Settings.Themes.Light ->
                    "Light"

                Settings.Themes.Dark ->
                    "Dark"
    in
    { language = lang, theme = theme }


settingsFromStore : StoreSettings -> Settings
settingsFromStore store =
    let
        lang =
            case store.language of
                "EN" ->
                    Settings.Languages.EN

                "ES" ->
                    Settings.Languages.ES

                _ ->
                    Settings.Languages.EN

        theme =
            case store.theme of
                "Light" ->
                    Settings.Themes.Light

                "Dark" ->
                    Settings.Themes.Dark

                _ ->
                    Settings.Themes.Dark
    in
    { language = lang, theme = theme }


themeFromStoreAndWidth : StoreSettings -> Int -> Theme
themeFromStoreAndWidth store width =
    let
        settings =
            settingsFromStore store

        theme =
            case settings.theme of
                Settings.Themes.Light ->
                    Theme.lightTheme

                Settings.Themes.Dark ->
                    Theme.darkTheme
    in
    { theme | device = getScreenSize width }



---- MODEL ----


type alias Model =
    { currentPage : Page
    , timeZone : Time.Zone
    , time : Time.Posix
    , settingsModal : Bool
    , settings : Settings
    , theme : Theme

    -- , corpus : Corpus
    }


type alias Flags =
    { currentDate : Int
    , width : Int
    , settings : StoreSettings
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { currentPage = Page.AboutMe
      , timeZone = utc
      , time = millisToPosix flags.currentDate
      , settingsModal = False
      , settings = settingsFromStore flags.settings
      , theme = themeFromStoreAndWidth flags.settings flags.width
      }
    , Task.perform PerformStart getViewport
      --, Task.perform AdjustTimeZone Time.here
      --|> Task.andThen ()
    )



---- UPDATE ----


type Msg
    = ChangePage Page
    | ClockTick Time.Posix
    | AdjustTimeZone Time.Zone
    | OpenSettings
    | CloseSettings
    | ChangeSettings Settings
    | PerformStart Browser.Dom.Viewport
    | ChangeWindowWidth Int



-- | SaveSettingsToLocalStorage StoreSettings
--| UpdateTheme
--| UpdateLanguage


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangePage page ->
            ( { model | currentPage = page }, Cmd.none )

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
            ( { model | settings = newSettings, theme = finalTheme }, saveSettings <| settingsToSave newSettings )

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



-- SaveSettingsToLocalStorage settings ->
--     -- saveSettings <| settingsToSave model
--     ( model, Cmd.none )
--UpdateTheme ->
--
--UpdateLanguage  ->


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
    let
        paddingY =
            case model.theme.device of
                Theme.BigDesktop ->
                    rem 2

                Theme.Desktop ->
                    rem 2

                Theme.Tablet ->
                    rem 2

                _ ->
                    rem 1.6

        paddingX =
            case model.theme.device of
                Theme.BigDesktop ->
                    rem 4

                Theme.Desktop ->
                    rem 4

                Theme.Tablet ->
                    rem 3

                _ ->
                    rem 1
    in
    div
        [ css
            [ minHeight (vh 100)
            , backgroundColor (hex model.theme.bgColor)
            ]
        ]
        [ if model.settingsModal then
            renderSettingsModal
                model.theme
                (corpusLang model)
                { close = CloseSettings
                , current = model.settings
                , themeSelector = themeSelector model
                , languageSelector = languageSelector model
                }

          else
            div [] []
        , div
            [ css
                [ padding2 paddingY paddingX
                , margin zero
                , color (hex model.theme.primaryColor)
                ]
            ]
            [ OpenSettings |> renderStatusBar model.theme (corpusLang model) model.timeZone model.time
            , div
                [ css
                    [ displayFlex
                    , if model.theme.device == Theme.Phone then
                        justifyContent center

                      else
                        justifyContent spaceBetween
                    ]
                ]
                [ renderHead model.theme <| corpusLang model
                , if model.theme.device == Theme.Desktop then
                    div
                        []
                        [ renderSocialNetworks model.theme ]

                  else
                    div [] []
                ]
            , renderPages model.theme (corpusLang model) model.currentPage pageUpdater
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


main : Program Flags Model Msg
main =
    Browser.element
        { view = view >> toUnstyled
        , init = init
        , update = update
        , subscriptions = subscriptions
        }

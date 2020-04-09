module Settings exposing (LangSetting(..), SettingOption(..), ThemeSetting(..), renderModal)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Theme exposing (bgColor, mainFonts, primaryColor)


type ThemeSetting
    = Light
    | Dark


type LangSetting
    = EN
    | ES


type SettingOption
    = Theme ThemeSetting
    | Language LangSetting


renderSetting : String -> SettingOption -> msg -> Html msg
renderSetting explain setting selected =
    let
        ( currentOption, options ) =
            case setting of
                Theme currentTheme ->
                    let
                        t =
                            case currentTheme of
                                Light ->
                                    "Light"

                                Dark ->
                                    "Dark"
                    in
                    ( t, [ "Light", "Dark" ] )

                Language currentLanguage ->
                    let
                        l =
                            case currentLanguage of
                                EN ->
                                    "English"

                                ES ->
                                    "Spanish"
                    in
                    ( l, [ "English", "Spanish" ] )
    in
    div []
        [ div
            [ css
                [ fontSize (rem 0.875)
                , opacity (num 0.6)
                ]
            ]
            [ text explain
            ]
        , div []
            [ div
                [ css
                    [ displayFlex
                    , margin2 (rem 0.5) (rem 0.5)
                    , marginBottom (rem 1.2)
                    ]
                ]
              <|
                List.map
                    (\opt ->
                        div
                            [ css
                                [ margin2 zero (rem 0.5)
                                , padding (rem 0.2)
                                , backgroundColor <|
                                    if currentOption == opt then
                                        hex primaryColor

                                    else
                                        hex bgColor
                                , color <|
                                    if currentOption == opt then
                                        hex bgColor

                                    else
                                        hex primaryColor
                                , hover
                                    [ cursor pointer
                                    , backgroundColor (hex primaryColor)
                                    , color (hex bgColor)
                                    ]
                                , transition
                                    [ Css.Transitions.backgroundColor 333
                                    ]
                                ]
                            , onClick selected
                            ]
                            [ text opt
                            ]
                    )
                    options
            ]
        ]


renderModal : { close : msg, options : List ( SettingOption, msg ) } -> Html msg
renderModal { close, options } =
    let
        settings =
            List.map
                (\( opt, msg ) ->
                    case opt of
                        Theme _ ->
                            ( "Color Theme", opt, msg )

                        Language _ ->
                            ( "Language", opt, msg )
                )
                options

        settingsOptions =
            List.map (\( explain, opt, change ) -> renderSetting explain opt change) settings
    in
    div
        [ css
            [ position absolute
            , width (vw 100)
            , height (vh 100)
            , zIndex (int 2)
            ]
        ]
        [ div
            [ css
                [ position absolute
                , backgroundColor (hex bgColor)
                , opacity (num 0.85)
                , width (pct 100)
                , height (pct 100)
                ]
            ]
            []
        , div
            [ css
                [ position absolute
                , zIndex (int 3)
                , width (pct 100)
                , height (pct 100)
                , displayFlex
                , justifyContent center
                ]
            ]
            [ div
                [ css
                    [ displayFlex
                    , flexFlow1 column
                    , justifyContent center
                    , color (hex primaryColor)
                    , fontFamilies mainFonts
                    ]
                ]
                [ div
                    [ css
                        [ backgroundColor (hex bgColor)
                        , padding (rem 1)
                        ]
                    ]
                    [ div
                        [ css
                            [ border3 (px 1) solid (hex primaryColor)
                            , padding (rem 1)
                            ]
                        ]
                        [ div
                            [ css
                                [ displayFlex
                                , flexFlow1 column
                                , minWidth (rem 8)
                                , alignItems center
                                ]
                            ]
                            [ div
                                [ css
                                    [ backgroundColor (hex bgColor)
                                    , padding2 zero (rem 1)
                                    , transforms [ translateY (rem -1.5) ]
                                    ]
                                ]
                                [ text "Settings"
                                ]
                            , div
                                [ css
                                    []
                                ]
                                [ div []
                                    --[ renderSetting "Color Theme" <| Theme themeSelected
                                    --, renderSetting "Language" <| Language langSelected
                                    --]
                                    settingsOptions
                                , div
                                    [ css
                                        [ fontSize (rem 1)
                                        , textDecoration underline
                                        , marginTop (rem 1)
                                        , textAlign right
                                        , hover
                                            [ cursor pointer
                                            ]
                                        ]
                                    , onClick close
                                    ]
                                    [ text "Close"
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]

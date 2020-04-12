module Settings.Settings exposing (Settings, renderSettingsModal)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Settings.Languages exposing (LangSetting, renderLanguageSettings)
import Settings.Themes exposing (ThemeSetting, renderThemeSettings)
import Theme exposing (Theme)


type alias Settings =
    { language : LangSetting
    , theme : ThemeSetting
    }


renderSettingsModal : Theme -> { close : msg, current : Settings, themeSelector : ThemeSetting -> msg, languageSelector : LangSetting -> msg } -> Html msg
renderSettingsModal theme { close, current, themeSelector, languageSelector } =
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
                , backgroundColor (hex theme.bgColor)
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
                    , color (hex theme.primaryColor)
                    , fontFamilies theme.mainFonts
                    ]
                ]
                [ div
                    [ css
                        [ backgroundColor (hex theme.bgColor)
                        , padding (rem 1)
                        ]
                    ]
                    [ div
                        [ css
                            [ border3 (px 1) solid (hex theme.primaryColor)
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
                                    [ backgroundColor (hex theme.bgColor)
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
                                    [ renderThemeSettings theme current.theme themeSelector
                                    , renderLanguageSettings theme current.language languageSelector
                                    ]
                                , div
                                    [ css
                                        [ fontSize (rem 1)
                                        , textDecoration underline
                                        , marginTop (rem 2)
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

module Settings.Themes exposing (ThemeSetting(..), renderThemeSettings)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Theme exposing (bgColor, mainFonts, primaryColor)


type ThemeSetting
    = Light
    | Dark


themes : List ( ThemeSetting, String )
themes =
    [ ( Light, "Light" )
    , ( Dark, "Dark" )
    ]


themeOptionString : ThemeSetting -> String
themeOptionString option =
    let
        head =
            List.filter (\( opt, _ ) -> option == opt) themes
                |> List.head

        theme =
            case head of
                Just ( _, v ) ->
                    v

                Nothing ->
                    ""
    in
    theme


explainTheme : String
explainTheme =
    "Color Theme"


renderOption : String -> Bool -> msg -> Html msg
renderOption optionName selected select =
    div
        [ css
            [ margin2 zero (rem 0.5)
            , padding (rem 0.2)
            , backgroundColor <|
                if selected then
                    hex primaryColor

                else
                    hex bgColor
            , color <|
                if selected then
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
        , onClick select
        ]
        [ text optionName
        ]


renderThemeSettings : ThemeSetting -> (ThemeSetting -> msg) -> Html msg
renderThemeSettings current selectionParser =
    div []
        [ div
            [ css
                [ fontSize (rem 0.875)
                , opacity (num 0.6)
                ]
            ]
            [ text explainTheme
            ]
        , div []
            [ div
                [ css
                    [ displayFlex
                    , margin2 (rem 0.5) (rem 0.5)
                    , marginBottom (rem 1.2)
                    ]
                ]
                [ renderOption (themeOptionString Light) (current == Light) (selectionParser Light)
                , renderOption (themeOptionString Dark) (current == Dark) (selectionParser Dark)
                ]
            ]
        ]

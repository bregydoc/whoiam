module Settings.Themes exposing (ThemeSetting(..), renderThemeSettings)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Theme exposing (Theme)


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


renderOption : Theme -> String -> Bool -> msg -> Html msg
renderOption theme optionName selected select =
    div
        [ css
            [ margin2 zero (rem 0.5)
            , padding (rem 0.2)
            , backgroundColor <|
                if selected then
                    hex theme.primaryColor

                else
                    hex theme.bgColor
            , color <|
                if selected then
                    hex theme.bgColor

                else
                    hex theme.primaryColor
            , hover
                [ cursor pointer
                , backgroundColor (hex theme.primaryColor)
                , color (hex theme.bgColor)
                ]
            , transition
                [ Css.Transitions.backgroundColor 333
                ]
            ]
        , onClick select
        ]
        [ text optionName
        ]


renderThemeSettings : Theme -> ThemeSetting -> (ThemeSetting -> msg) -> Html msg
renderThemeSettings theme current selectionParser =
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
                [ renderOption theme (themeOptionString Light) (current == Light) (selectionParser Light)
                , renderOption theme (themeOptionString Dark) (current == Dark) (selectionParser Dark)
                ]
            ]
        ]

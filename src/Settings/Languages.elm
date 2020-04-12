module Settings.Languages exposing (LangSetting(..), renderLanguageSettings)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Theme exposing (Theme)


type LangSetting
    = EN
    | ES


languages : List ( LangSetting, String )
languages =
    [ ( EN, "English" )
    , ( ES, "Spanish" )
    ]


languageOptionString : LangSetting -> String
languageOptionString lang =
    let
        head =
            List.filter (\( opt, _ ) -> lang == opt) languages
                |> List.head

        language =
            case head of
                Just ( _, v ) ->
                    v

                Nothing ->
                    ""
    in
    language


explainLanguage : String
explainLanguage =
    "Language"


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


renderLanguageSettings : Theme -> LangSetting -> (LangSetting -> msg) -> Html msg
renderLanguageSettings theme current selectionParser =
    div []
        [ div
            [ css
                [ fontSize (rem 0.875)
                , opacity (num 0.6)
                ]
            ]
            [ text explainLanguage
            ]
        , div []
            [ div
                [ css
                    [ displayFlex
                    , margin2 (rem 0.5) (rem 0.5)
                    , marginBottom (rem 1.2)
                    ]
                ]
                [ renderOption theme (languageOptionString EN) (current == EN) (selectionParser EN)
                , renderOption theme (languageOptionString ES) (current == ES) (selectionParser ES)
                ]
            ]
        ]

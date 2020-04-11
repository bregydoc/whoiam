module Content.ProjectCard exposing (renderProjectCard)

import Content.Projects exposing (Project, languageToString)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, target)
import Theme exposing (primaryColor)


renderProjectCard : Project -> Html msg
renderProjectCard project =
    div
        [ css
            [ -- margin (rem 1)
              border3 (px 1) solid (hex primaryColor)
            , marginRight (rem 1.4)
            , minWidth (rem 18)
            , displayFlex
            , flexFlow1 column
            ]
        ]
        [ div
            [ css
                [ borderBottom3 (px 1) solid (hex primaryColor)
                , padding (rem 1)
                ]
            ]
            [ text project.name ]
        , div
            [ css
                [ padding (rem 1)
                , lineHeight (rem 1.5)
                ]
            ]
            [ text project.description ]
        , div
            [ css
                [ displayFlex
                , justifyContent spaceAround
                , marginTop auto
                , marginBottom (rem 1)
                ]
            ]
            [ div
                [ css
                    [ textAlign center
                    ]
                ]
                [ div
                    [ css
                        [ marginBottom (rem 0.5)
                        , color (hex primaryColor)
                        , opacity (num 0.56)
                        ]
                    ]
                    [ text "Language"
                    ]
                , div []
                    [ text <| languageToString project.language ]
                ]
            , div
                [ css
                    [ textAlign center
                    ]
                ]
                [ div
                    [ css
                        [ marginBottom (rem 0.5)
                        , color (hex primaryColor)
                        , opacity (num 0.56)
                        ]
                    ]
                    [ text "Stars"
                    ]
                , div []
                    [ text <| String.fromInt project.stars ]
                ]
            ]
        , div
            [ css
                [ padding (rem 1)
                , borderTop3 (px 1) solid (hex primaryColor)
                ]
            ]
            [ div
                [ css
                    [ displayFlex
                    , justifyContent center
                    ]
                ]
                [ a [ href project.link, Html.Styled.Attributes.target "_blank", css [ color (hex primaryColor) ] ]
                    [ text "OPEN"
                    ]
                ]
            ]
        ]

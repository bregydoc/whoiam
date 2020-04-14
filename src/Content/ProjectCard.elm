module Content.ProjectCard exposing (renderProjectCard)

import Content.Projects exposing (Project, languageToString)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, target)
import TextResource exposing (Language, mainCorpus, read)
import Theme exposing (Theme)


renderProjectCard : Theme -> Language -> Project -> Html msg
renderProjectCard theme lang project =
    div
        [ css
            [ -- margin (rem 1)
              border3 (px 1) solid (hex theme.primaryColor)
            , marginRight (rem 1.4)
            , minWidth (rem 18)
            , displayFlex
            , flexFlow1 column
            , textDecoration none
            , color (hex theme.primaryColor)
            ]

        --, href project.link
        --, Html.Styled.Attributes.target "_blank"
        ]
        [ div
            [ css
                [ borderBottom3 (px 1) solid (hex theme.primaryColor)
                , padding (rem 1)
                ]
            ]
            [ text project.name ]
        , div
            [ css
                [ padding (rem 1)
                , lineHeight (rem 1.5)
                , fontSize (rem 0.875)
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
                        , color (hex theme.primaryColor)
                        , opacity (num 0.56)
                        , fontSize (rem 0.875)
                        ]
                    ]
                    [ text <| read lang "programminglang" mainCorpus
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
                        , color (hex theme.primaryColor)
                        , opacity (num 0.56)
                        , fontSize (rem 0.875)
                        ]
                    ]
                    [ text <| read lang "stars" mainCorpus
                    ]
                , div []
                    [ text <| String.fromInt project.stars ]
                ]
            ]
        , div
            [ css
                [ padding (rem 1)
                , borderTop3 (px 1) solid (hex theme.primaryColor)
                ]
            ]
            [ div
                [ css
                    [ displayFlex
                    , justifyContent center
                    ]
                ]
                [ a [ href project.link, Html.Styled.Attributes.target "_blank", css [ color (hex theme.primaryColor) ] ]
                    [ text <| read lang "seemore" mainCorpus
                    ]
                ]
            ]
        ]

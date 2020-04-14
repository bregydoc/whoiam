module Content.Minsky exposing (minskyBody)

import Css exposing (bold, center, color, displayFlex, fontWeight, hex, lineHeight, margin2, marginLeft, marginTop, rem)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, target)
import Icons.Minsky exposing (renderMinskyLogoWithScale)
import TextResource exposing (Language, mainCorpus, read)
import Theme exposing (Theme)


minskyBody : Theme -> Language -> Html msg
minskyBody theme lang =
    div
        [ css
            [ marginTop (rem 2) ]
        ]
        [ div
            [ css
                [ marginLeft (rem 2)
                ]
            ]
            [ renderMinskyLogoWithScale 0.6 theme.primaryColor
            ]
        , div
            [ css
                [ -- marginTop (rem 1)
                  lineHeight (rem 2)
                , margin2 (rem 1) (rem 2)
                ]
            ]
            [ text <| read lang "minsky_summary" mainCorpus
            , div
                [ css
                    [ marginTop (rem 1) ]
                ]
                [ text <| read lang "minsky_action" mainCorpus ++ " "
                , a
                    [ href "https://minsky.cc"
                    , target "_blank"
                    , css
                        [ color (hex theme.primaryColor)
                        , fontWeight bold
                        ]
                    ]
                    [ text "https://minsky.cc" ]
                ]
            ]
        ]

module Content.Minsky exposing (minskyBody)

import Css exposing (bold, center, color, displayFlex, fontWeight, hex, lineHeight, margin2, marginLeft, marginTop, rem)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, target)
import Icons.Minsky exposing (renderMinskyLogoWithScale)
import Theme exposing (primaryColor)


minskyBody : Html msg
minskyBody =
    div
        [ css
            []
        ]
        [ div
            [ css
                [ marginLeft (rem 1)
                ]
            ]
            [ renderMinskyLogoWithScale 0.6 primaryColor
            ]
        , div
            [ css
                [ -- marginTop (rem 1)
                  lineHeight (rem 2)
                , margin2 (rem 1) (rem 2)
                ]
            ]
            [ text "Minsky is a peruvian initiative to democratize and boost our country (Peru) with technology."
            , text " The main goal of Minsky is generate digital products for the community based on open source and modern technologies stack."
            , div
                [ css
                    [ marginTop (rem 1) ]
                ]
                [ text "See more at our homepage "
                , a
                    [ href "https://minsky.cc"
                    , target "_blank"
                    , css
                        [ color (hex primaryColor)
                        , fontWeight bold
                        ]
                    ]
                    [ text "https://minsky.cc" ]
                ]
            ]
        ]

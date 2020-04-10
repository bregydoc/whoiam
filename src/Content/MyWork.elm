module Content.MyWork exposing (myWorkBody)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Theme exposing (primaryColor)


renderWorkType : String -> Html msg
renderWorkType title =
    div
        [ css
            [ border3 (px 1) solid (hex primaryColor)
            , padding (rem 1)
            ]
        ]
        [ text title ]


myWorkBody : Html msg
myWorkBody =
    div
        [ css [ displayFlex ]
        ]
        [ div
            [ css
                [ displayFlex
                , width (pct 100)
                , justifyContent spaceBetween
                ]
            ]
            [ renderWorkType "Personal Work"
            , renderWorkType "Research"
            , renderWorkType "Industrial Experience"
            ]
        ]

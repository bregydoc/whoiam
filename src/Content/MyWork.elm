module Content.MyWork exposing (myWorkBody)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


myWorkBody : Html msg
myWorkBody =
    div
        [ css [ displayFlex ]
        ]
        [ text "here will be my work"
        ]

module Content.MyInterests exposing (myInterestsBody)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


myInterestsBody : Html msg
myInterestsBody =
    div
        [ css [ displayFlex ]
        ]
        [ text "here will be my interests"
        ]

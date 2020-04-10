module Content.MyInterests exposing (myInterestsBody)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


interests : List String
interests =
    [ "programming"
    , "development"
    , "biology"
    , "human mind & learning"
    , "science"
    ]


myInterestsBody : Html msg
myInterestsBody =
    div
        [ css [ displayFlex ]
        ]
        [ ul []
            (interests
                |> List.map
                    (\t ->
                        li [ css [ marginBottom (rem 0.5) ] ]
                            [ text t ]
                    )
            )
        ]

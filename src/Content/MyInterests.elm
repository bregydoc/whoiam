module Content.MyInterests exposing (myInterestsBody)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import TextResource exposing (Language, mainCorpus, read)


interests : Language -> List String
interests lang =
    [ read lang "myinterests_programming" mainCorpus
    , read lang "myinterests_development" mainCorpus
    , read lang "myinterests_biology" mainCorpus
    , read lang "myinterests_humanmind" mainCorpus
    , read lang "myinterests_science" mainCorpus
    ]


myInterestsBody : Language -> Html msg
myInterestsBody lang =
    div
        [ css [ displayFlex ]
        ]
        [ ul []
            (interests lang
                |> List.map
                    (\t ->
                        li [ css [ marginBottom (rem 0.5) ] ]
                            [ text t ]
                    )
            )
        ]

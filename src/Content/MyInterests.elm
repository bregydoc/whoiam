module Content.MyInterests exposing (myInterestsBody)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import TextResource exposing (Language, mainCorpus, read)


interests : Language -> List ( String, String )
interests lang =
    [ ( read lang "myinterests_programming" mainCorpus, read lang "myinterests_programmingwhy" mainCorpus )
    , ( read lang "myinterests_development" mainCorpus, read lang "myinterests_developmentwhy" mainCorpus )
    , ( read lang "myinterests_biology" mainCorpus, read lang "myinterests_biologywhy" mainCorpus )
    , ( read lang "myinterests_humanmind" mainCorpus, read lang "myinterests_humanmindwhy" mainCorpus )
    , ( read lang "myinterests_science" mainCorpus, read lang "myinterests_sciencewhy" mainCorpus )
    ]


myInterestsBody : Language -> Html msg
myInterestsBody lang =
    div
        [ css [ displayFlex ]
        ]
        [ ul []
            (interests lang
                |> List.map
                    (\( t, why ) ->
                        li [ css [ marginBottom (rem 1) ] ]
                            [ div []
                                [ text t
                                ]
                            , div [ css [ marginTop (rem 0.2), opacity (num 0.56) ] ] [ text why ]
                            ]
                    )
            )
        ]

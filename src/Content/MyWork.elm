module Content.MyWork exposing (WorkType(..), myWorkBody)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Icons.Icosahedron exposing (Icosahedron, renderIcosahedronIcon)
import Theme exposing (bgColor, primaryColor)


type WorkType
    = MainMenu
    | PersonalProjects
    | Research
    | IndustrialExperience


renderSubPageLayout : String -> Html msg -> Html msg
renderSubPageLayout title content =
    div
        [ css
            [ displayFlex
            , flexFlow1 column
            , width (pct 100)
            ]
        ]
        [ div []
            [ text title ]
        , div []
            [ content ]
        ]


renderWorkType : String -> msg -> Html msg -> Html msg
renderWorkType title selected icon =
    div
        [ css
            [ border3 (px 2) solid transparent
            , transition
                [--Css.Transitions.border 333
                ]
            , hover
                [ cursor pointer

                --, border3 (px 2) solid (hex primaryColor)
                ]
            ]
        , onClick selected
        ]
        [ div
            [ css
                [ displayFlex
                , padding4 (rem 1.5) zero zero zero
                , border3 (px 1) solid (hex primaryColor)
                , flexFlow1 column
                , alignItems center
                , minWidth (rem 16)
                ]
            ]
            [ div
                [ css
                    [ margin2 (rem 1) zero
                    ]
                ]
                [ icon
                ]
            , div
                [ css
                    [ displayFlex
                    , width (pct 100)
                    , marginTop (rem 1)
                    , fontSize (rem 1.0)
                    , justifyContent center
                    , padding2 (rem 1) zero
                    , borderTop3 (px 1) solid (hex primaryColor)
                    ]
                ]
                [ div
                    [ css
                        [ textAlign center
                        ]
                    ]
                    [ div [] [ text title ]
                    ]
                ]
            ]
        ]


renderMainMenu : (WorkType -> msg) -> Html msg
renderMainMenu updater =
    div
        [ css
            [ displayFlex
            , width (pct 100)
            , justifyContent spaceBetween
            , flexWrap wrap
            ]
        ]
        [ renderIcosahedronIcon Icons.Icosahedron.Type1 primaryColor
            |> renderWorkType "Personal Projects" (updater PersonalProjects)
        , renderIcosahedronIcon Icons.Icosahedron.Type2 primaryColor
            |> renderWorkType "Research" (updater Research)
        , renderIcosahedronIcon Icons.Icosahedron.Type3 primaryColor
            |> renderWorkType "Industrial Experience" (updater IndustrialExperience)
        ]


renderSubPage : WorkType -> (WorkType -> msg) -> Html msg
renderSubPage w updater =
    case w of
        MainMenu ->
            renderMainMenu updater

        PersonalProjects ->
            renderSubPageLayout "Personal Projects" <| text "hello world"

        Research ->
            renderSubPageLayout "Research" <| text "hello world"

        IndustrialExperience ->
            renderSubPageLayout "Industrial Experience" <| text "hello world"


myWorkBody : WorkType -> (WorkType -> msg) -> Html msg
myWorkBody currentState updater =
    div
        [ css [ displayFlex ]
        ]
        [ renderSubPage currentState updater ]

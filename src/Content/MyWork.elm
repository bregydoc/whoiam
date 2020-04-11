module Content.MyWork exposing (WorkType(..), renderMyWorkPage)

import Content.Content exposing (projects)
import Content.ProjectCard exposing (renderProjectCard)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Icons.BackArrow exposing (renderBackArrow)
import Icons.Icosahedron exposing (Icosahedron, renderIcosahedronIcon)
import Theme exposing (bgColor, primaryColor)


type WorkType
    = MainMenu
    | PersonalProjects
    | Research
    | IndustrialExperience


renderSubPageLayout : String -> msg -> Html msg -> Html msg
renderSubPageLayout title back content =
    div
        [ css
            [ displayFlex
            , flexFlow1 column
            , width (pct 100)
            , margin4 (rem 2) (rem 2) (rem 2) (rem 2)
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , alignItems center
                , hover
                    [ cursor pointer
                    ]
                ]
            , onClick back
            ]
            [ div
                [ css
                    [ marginRight (rem 1)
                    , paddingTop (rem 0.2)
                    ]
                ]
                [ renderBackArrow primaryColor ]
            , div
                [ css
                    [ fontWeight bold
                    , backgroundColor (hex primaryColor)
                    , color (hex bgColor)
                    , padding2 (rem 0.4) (rem 0.6)
                    ]
                ]
                [ text title
                ]
            ]
        , div
            [ css
                [ marginTop (rem 2)
                , marginLeft (rem 2)
                , marginRight (rem 2)
                ]
            ]
            [ content ]
        ]


renderWorkType : String -> msg -> Html msg -> Html msg
renderWorkType title selected icon =
    div
        [ css
            [ border3 (px 2) solid transparent
            , margin (rem 2)

            --, transition
            --    [--Css.Transitions.border 333
            --    ]
            , hover
                [ cursor pointer
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
                    [ div
                        []
                        [ text title ]
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
            , justifyContent spaceAround
            , flexWrap wrap
            , marginBottom (rem 2)
            ]
        ]
        [ renderIcosahedronIcon Icons.Icosahedron.Type1 primaryColor
            |> renderWorkType "Personal Projects" (updater PersonalProjects)
        , renderIcosahedronIcon Icons.Icosahedron.Type2 primaryColor
            |> renderWorkType "Research" (updater Research)
        , renderIcosahedronIcon Icons.Icosahedron.Type3 primaryColor
            |> renderWorkType "Industrial Experience" (updater IndustrialExperience)
        ]


renderPersonalProjects : Html msg
renderPersonalProjects =
    div
        [ css
            [ displayFlex
            , overflowX scroll

            --, flexWrap wrap
            ]
        ]
        (List.map renderProjectCard projects)


renderMyWorkPage : WorkType -> (WorkType -> msg) -> Html msg
renderMyWorkPage w updater =
    let
        render =
            case w of
                MainMenu ->
                    renderMainMenu updater

                PersonalProjects ->
                    renderSubPageLayout "Personal Projects" (updater MainMenu) <| renderPersonalProjects

                Research ->
                    renderSubPageLayout "Research" (updater MainMenu) <| text "hello world"

                IndustrialExperience ->
                    renderSubPageLayout "Industrial Experience" (updater MainMenu) <| text "hello world"
    in
    div
        [ css
            [ displayFlex
            ]
        ]
        [ render ]

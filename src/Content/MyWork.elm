module Content.MyWork exposing (WorkType(..), renderMyWorkPage)

import Content.Content exposing (projects)
import Content.ProjectCard exposing (renderProjectCard)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Icons.BackArrow exposing (renderBackArrowIcon)
import Icons.Icosahedron exposing (Icosahedron, renderIcosahedronIcon)
import Theme exposing (Theme)


type WorkType
    = MainMenu
    | PersonalProjects
    | Research
    | IndustrialExperience


renderSubPageLayout : Theme -> String -> msg -> Html msg -> Html msg
renderSubPageLayout theme title back content =
    div
        [ css
            [ width (pct 100)
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , flexFlow1 column
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
                    [ renderBackArrowIcon theme.primaryColor ]
                , div
                    [ css
                        [ fontWeight bold
                        , backgroundColor (hex theme.primaryColor)
                        , color (hex theme.bgColor)
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
        ]


renderWorkType : Theme -> String -> msg -> Html msg -> Html msg
renderWorkType theme title selected icon =
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
                , border3 (px 1) solid (hex theme.primaryColor)
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
                    , borderTop3 (px 1) solid (hex theme.primaryColor)
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


renderMainMenu : Theme -> (WorkType -> msg) -> Html msg
renderMainMenu theme updater =
    div
        [ css
            [ displayFlex
            , width (pct 100)
            , justifyContent spaceAround
            , flexWrap wrap
            , marginBottom (rem 2)
            ]
        ]
        [ renderIcosahedronIcon Icons.Icosahedron.Type1 theme.primaryColor
            |> renderWorkType theme "Personal Projects" (updater PersonalProjects)
        , renderIcosahedronIcon Icons.Icosahedron.Type2 theme.primaryColor
            |> renderWorkType theme "Research" (updater Research)
        , renderIcosahedronIcon Icons.Icosahedron.Type3 theme.primaryColor
            |> renderWorkType theme "Industrial Experience" (updater IndustrialExperience)
        ]


renderPersonalProjects : Theme -> Html msg
renderPersonalProjects theme =
    div
        [ css
            [ displayFlex
            , overflowX scroll

            --, maxWidth fitContent
            --, flexWrap wrap
            ]
        ]
        (List.map (renderProjectCard theme) projects)


renderMyWorkPage : Theme -> WorkType -> (WorkType -> msg) -> Html msg
renderMyWorkPage theme w updater =
    let
        render =
            case w of
                MainMenu ->
                    renderMainMenu theme updater

                PersonalProjects ->
                    renderSubPageLayout theme "Personal Projects" (updater MainMenu) <| renderPersonalProjects theme

                Research ->
                    renderSubPageLayout theme "Research" (updater MainMenu) <| text "hello world"

                IndustrialExperience ->
                    renderSubPageLayout theme "Industrial Experience" (updater MainMenu) <| text "hello world"
    in
    div
        [ css
            [ displayFlex
            ]
        ]
        [ render ]

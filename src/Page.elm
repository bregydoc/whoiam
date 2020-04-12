module Page exposing (Page(..), renderPages)

import Content.About exposing (aboutBody)
import Content.Minsky exposing (minskyBody)
import Content.MyInterests exposing (myInterestsBody)
import Content.MyWork exposing (WorkType, renderMyWorkPage)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Theme exposing (Theme)


type Page
    = AboutMe
    | MyInterests
    | MyWork WorkType
    | Minsky


renderOptionButton : Theme -> Page -> ( Page, msg ) -> Html msg
renderOptionButton theme currentPage ( page, msg ) =
    let
        title =
            case page of
                AboutMe ->
                    "About Me"

                MyInterests ->
                    "My Interests"

                MyWork _ ->
                    "My work"

                Minsky ->
                    "Minsky"
    in
    div
        [ css
            [ marginLeft (rem 2)
            ]
        ]
        [ div
            [ css
                [ if currentPage == page then
                    color <| hex theme.bgColor

                  else
                    color <| hex theme.primaryColor

                --
                , if currentPage == page then
                    backgroundColor <| hex theme.primaryColor

                  else
                    backgroundColor <| hex theme.bgColor

                --
                , if currentPage == page then
                    fontWeight bold

                  else
                    fontWeight normal

                --
                , padding2 (rem 0.6) (rem 0.8)
                , transforms [ translateY (rem -1.2) ]
                , hover
                    [ cursor pointer
                    , backgroundColor (hex theme.primaryColor)
                    , color (hex theme.bgColor)
                    ]
                , transition
                    [ Css.Transitions.backgroundColor 333
                    , Css.Transitions.fontWeight 333
                    ]
                ]
            , onClick msg
            ]
            [ text title ]
        ]


pages : List Page
pages =
    [ AboutMe
    , MyWork Content.MyWork.MainMenu
    , MyInterests
    , Minsky
    ]


renderPages : Theme -> Page -> (Page -> msg) -> Html msg
renderPages theme currentPage updatePage =
    div
        [ css
            [ border3 (px 1.0) solid (hex theme.primaryColor)
            , transition
                [ Css.Transitions.height 333
                ]
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , fontFamilies theme.mainFonts

                --, margin2 zero zero
                --, marginBottom (rem -1)
                ]
            ]
            (List.map (\page -> ( page, updatePage page )) pages
                |> List.map (renderOptionButton theme currentPage)
            )
        , div
            [ css
                [ fontFamilies theme.mainFonts
                ]
            ]
            [ div []
                [ case currentPage of
                    AboutMe ->
                        aboutBody theme

                    MyInterests ->
                        myInterestsBody

                    MyWork currentWork ->
                        renderMyWorkPage theme currentWork <| \w -> updatePage (MyWork w)

                    Minsky ->
                        minskyBody theme
                ]
            ]
        ]

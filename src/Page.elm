module Page exposing (Page(..), renderPages)

import Content.About exposing (aboutBody)
import Content.MyInterests exposing (myInterestsBody)
import Content.MyWork exposing (myWorkBody)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Theme exposing (bgColor, mainFonts, primaryColor)


type Page
    = AboutMe
    | MyInterests
    | MyWork


renderOptionButton : Page -> ( Page, msg ) -> Html msg
renderOptionButton currentPage ( page, msg ) =
    let
        title =
            case page of
                AboutMe ->
                    "About Me"

                MyInterests ->
                    "My Interests"

                MyWork ->
                    "My work"
    in
    div
        [ css
            [ marginLeft (rem 2)
            ]
        ]
        [ div
            [ css
                [ if currentPage == page then
                    color <| hex bgColor

                  else
                    color <| hex primaryColor

                --
                , if currentPage == page then
                    backgroundColor <| hex primaryColor

                  else
                    backgroundColor <| hex bgColor

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
                    , backgroundColor (hex primaryColor)
                    , color (hex bgColor)
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


renderPages : Page -> List ( Page, msg ) -> Html msg
renderPages currentPage pages =
    div
        [ css
            [ border3 (px 1.0) solid (hex primaryColor)
            , transition
                [ Css.Transitions.height 333
                ]
            ]
        ]
        [ div
            [ css
                [ displayFlex
                , fontFamilies mainFonts
                , margin2 zero zero
                ]
            ]
            (pages
                |> List.map (renderOptionButton currentPage)
            )
        , div
            [ css
                [ padding (rem 2)
                , fontFamilies mainFonts
                ]
            ]
            [ div []
                [ case currentPage of
                    AboutMe ->
                        aboutBody

                    MyInterests ->
                        myInterestsBody

                    MyWork ->
                        myWorkBody
                ]
            ]
        ]

module Page exposing (Page(..), renderOptionPage, renderPage)

import Content.About exposing (aboutBody)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Theme exposing (bgColor, primaryColor)


type Page
    = AboutMe
    | MyInterests
    | MyWork


renderOptionPage : String -> Page -> Page -> msg -> Html msg
renderOptionPage title currentPage page msg =
    div
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


renderPage : Page -> Html msg
renderPage page =
    div []
        [ case page of
            AboutMe ->
                aboutBody

            MyInterests ->
                text "here will be my interests"

            MyWork ->
                text "here will be my works"
        ]

module Page exposing (Page(..), renderPages)

import Content.About exposing (aboutBody)
import Content.Minsky exposing (minskyBody)
import Content.MyInterests exposing (myInterestsBody)
import Content.MyWork exposing (WorkType, myWorkBody)
import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Theme exposing (bgColor, mainFonts, primaryColor)


type Page
    = AboutMe
    | MyInterests
    | MyWork WorkType
    | Minsky


renderOptionButton : Page -> ( Page, msg ) -> Html msg
renderOptionButton currentPage ( page, msg ) =
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


pages : List Page
pages =
    [ AboutMe
    , MyInterests
    , MyWork Content.MyWork.MainMenu
    , Minsky
    ]


updateMyWork : (Page -> msg) -> (WorkType -> msg)
updateMyWork updater =
    \w -> updater <| MyWork w



--updatePage


renderPages : Page -> (Page -> msg) -> Html msg
renderPages currentPage updatePage =
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
            (List.map (\page -> ( page, updatePage page )) pages
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

                    MyWork currentWork ->
                        myWorkBody currentWork <| updateMyWork updatePage

                    Minsky ->
                        minskyBody
                ]
            ]
        ]

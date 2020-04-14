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
import Icons.DownArrow exposing (renderDownArrow)
import TextResource exposing (Language, mainCorpus, read)
import Theme exposing (Theme)


type Page
    = AboutMe
    | MyInterests
    | MyWork WorkType
    | Minsky


renderOptionButton : Theme -> Language -> Page -> ( Page, msg ) -> Html msg
renderOptionButton theme lang currentPage ( page, msg ) =
    let
        title =
            case page of
                AboutMe ->
                    read lang "aboutme" mainCorpus

                MyInterests ->
                    read lang "myinterests" mainCorpus

                MyWork _ ->
                    read lang "mywork" mainCorpus

                Minsky ->
                    read lang "minsky" mainCorpus
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


renderPages : Theme -> Language -> Page -> (Page -> msg) -> Html msg
renderPages theme lang currentPage updatePage =
    let
        optionsBar =
            if theme.device == Theme.Phone then
                [ div
                    [ css
                        [ displayFlex
                        , width (pct 100)
                        ]
                    ]
                    [ renderOptionButton theme lang currentPage <| ( currentPage, updatePage currentPage )
                    , div
                        [ css
                            [ transforms [ translateY (rem -1.2) ]
                            , marginLeft auto
                            , displayFlex
                            , alignItems center
                            , backgroundColor (hex theme.bgColor)
                            , marginRight (rem 1.2)
                            , padding4 (rem 0.6) (rem 0.4) (rem 0.4) (rem 0.4)
                            ]
                        ]
                        [ renderDownArrow theme.primaryColor ]
                    ]
                ]

            else
                List.map (\page -> ( page, updatePage page )) pages
                    |> List.map (renderOptionButton theme lang currentPage)
    in
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
            optionsBar
        , div
            [ css
                [ fontFamilies theme.mainFonts
                ]
            ]
            [ div []
                [ case currentPage of
                    AboutMe ->
                        aboutBody theme lang

                    MyInterests ->
                        myInterestsBody lang

                    MyWork currentWork ->
                        renderMyWorkPage theme lang currentWork <| \w -> updatePage (MyWork w)

                    Minsky ->
                        minskyBody theme lang
                ]
            ]
        ]

module Content.About exposing (aboutBody)

import Css exposing (..)
import Html.Styled exposing (Html, div, text)
import Html.Styled.Attributes exposing (css)
import Icons.Owl exposing (renderOwlIconWithScale)
import TextResource exposing (Language, mainCorpus, read)
import Theme exposing (Theme)


aboutBody : Theme -> Language -> Html msg
aboutBody theme lang =
    let
        flow =
            case theme.device of
                Theme.BigDesktop ->
                    row

                Theme.Desktop ->
                    row

                _ ->
                    columnReverse
    in
    div
        [ css
            [ displayFlex
            , flexFlow1 flow
            , margin (rem 2)
            , if theme.device == Theme.Phone || theme.device == Theme.Tablet then
                alignItems center

              else
                alignItems start
            ]
        ]
        [ div
            [ css
                [ flexGrow (num 1)
                , paddingRight (rem 1)
                , lineHeight (rem 2)
                ]
            ]
            [ div
                []
                [ text <| read lang "aboutme_contentmain" mainCorpus
                ]
            , div
                [ css [ marginTop (rem 1.8) ]
                ]
                [ div
                    [ css
                        [ fontSize (rem 1.6)
                        , fontWeight bold
                        , marginBottom (rem 0.6)
                        ]
                    ]
                    [ text <| read lang "aboutme_contentpersonaltitle" mainCorpus ]
                , div []
                    [ text <| read lang "aboutme_contentpersonal" mainCorpus ]
                ]
            ]
        , div
            [ css
                [ if theme.device == Theme.Phone || theme.device == Theme.Tablet then
                    marginBottom (rem 2)

                  else
                    margin zero
                ]
            ]
            [ renderOwlIconWithScale 0.75 theme.primaryColor ]
        ]

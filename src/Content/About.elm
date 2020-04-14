module Content.About exposing (aboutBody)

import Css exposing (..)
import Html.Styled exposing (Html, div, text)
import Html.Styled.Attributes exposing (css)
import Icons.Owl exposing (renderOwlIconWithScale)
import Theme exposing (Theme)


aboutBody : Theme -> Html msg
aboutBody theme =
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
            [ text "Work in progress. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac mauris eleifend, pulvinar lorem at, efficitur lacus. Nulla vel lacinia lacus. Etiam tristique nisl tincidunt, faucibus turpis consectetur, imperdiet enim. Sed eros arcu, accumsan vel auctor ac, dictum in velit. Aenean suscipit nunc vel velit sodales, eu vestibulum arcu ultricies. Vivamus lacus lacus, dignissim vel lobortis et, placerat gravida eros. Nam nec lobortis dolor. Morbi ut lacus in tortor pharetra bibendum." ]
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

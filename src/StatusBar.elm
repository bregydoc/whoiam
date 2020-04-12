module StatusBar exposing (renderStatusBar)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Icons.Battery exposing (renderBatteryIcon)
import LifeSpan exposing (lifePercent)
import Round
import StatusTime exposing (timeToDate, timeToStr)
import Theme exposing (Theme)
import Time exposing (Month(..), millisToPosix)


renderStatusBar : Theme -> Time.Zone -> Time.Posix -> msg -> Html msg
renderStatusBar theme zone time openSettings =
    div
        [ css
            [ displayFlex
            , fontFamilies theme.mainFonts
            , alignItems center
            , opacity <|
                if time == millisToPosix 0 then
                    num 0

                else
                    num 1
            , if theme.device == Theme.Phone then
                justifyContent center

              else
                justifyContent flexStart
            , transition
                [ Css.Transitions.opacity 100
                ]
            ]
        ]
        [ text ((Round.round 2 <| lifePercent zone time * 100) ++ "%")
        , div
            [ css
                [ marginLeft (rem 0.5)
                , marginRight (rem 0.5)
                , alignItems center
                , paddingTop (rem 0.1)
                ]
            ]
            [ renderBatteryIcon theme.primaryColor ]
        , text " | "
        , text <| timeToDate zone time -- "Tue Apr 7"
        , text " | "
        , text <| timeToStr zone time
        , if theme.device /= Theme.Phone then
            text " | "

          else
            div [] []
        , if theme.device /= Theme.Phone then
            div
                [ css
                    [ marginLeft (rem 0.5)
                    , textDecoration underline
                    , hover
                        [ cursor pointer
                        ]
                    ]
                , onClick openSettings
                ]
                [ text "settings" ]

          else
            div [] []
        ]

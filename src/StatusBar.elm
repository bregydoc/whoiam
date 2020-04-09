module StatusBar exposing (renderStatusBar)

import Battery exposing (viewBattery)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Life exposing (lifePercent)
import Round
import StatusTime exposing (timeToDate, timeToStr)
import Theme exposing (mainFonts, primaryColor)
import Time exposing (Month(..), millisToPosix)


renderStatusBar : Time.Zone -> Time.Posix -> msg -> Html msg
renderStatusBar zone time openSettings =
    if time == millisToPosix 0 then
        div [] []

    else
        div
            [ css
                [ displayFlex
                , fontFamilies mainFonts
                , alignItems center
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
                [ viewBattery primaryColor ]
            , text " | "
            , text <| timeToDate zone time -- "Tue Apr 7"
            , text " | "
            , text <| timeToStr zone time
            , text " | "
            , div
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
            ]

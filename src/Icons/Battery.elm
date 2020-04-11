module Icons.Battery exposing (renderBatteryIcon)

import Html.Styled exposing (Html)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (d, fill, height, stroke, strokeLinecap, strokeMiterlimit, strokeWidth, viewBox, width)


renderBatteryIcon : String -> Html msg
renderBatteryIcon color =
    svg
        [ width "25"
        , height "13"
        , viewBox "0 0 25 13"
        , fill "none"
        ]
        [ path
            [ d "M18.8741 0.994141H3.50956C2.25294 0.994141 1.23425 2.01283 1.23425 3.26944V9.8713C1.23425 11.1279 2.25294 12.1466 3.50956 12.1466H18.8741C20.1307 12.1466 21.1494 11.1279 21.1494 9.8713V3.26944C21.1494 2.01283 20.1307 0.994141 18.8741 0.994141Z"
            , stroke color
            , strokeWidth "1.59321"
            , strokeMiterlimit "10"
            , strokeLinecap "square"
            ]
            []
        , path
            [ d "M11.391 3.72894H4.1065C3.99651 3.72894 3.90735 3.81811 3.90735 3.92809V9.21207C3.90735 9.32206 3.99651 9.41123 4.1065 9.41123H11.391C11.5009 9.41123 11.5901 9.32206 11.5901 9.21207V3.92809C11.5901 3.81811 11.5009 3.72894 11.391 3.72894Z"
            , fill color
            , stroke color
            , strokeWidth "1.59321"
            , strokeMiterlimit "10"
            , strokeLinecap "square"
            ]
            []
        , path
            [ d "M23.5392 4.71173V8.42889"
            , stroke color
            , strokeWidth "1.59321"
            , strokeMiterlimit "10"
            , strokeLinecap "round"
            ]
            []
        ]

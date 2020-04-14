module Icons.DownArrow exposing (renderDownArrow)

import Html.Styled exposing (Html)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (d, fill, height, stroke, strokeLinecap, strokeLinejoin, strokeWidth, viewBox, width)


renderDownArrow : String -> Html msg
renderDownArrow color =
    svg
        [ width "15"
        , height "9"
        , viewBox
            "0 0 15 9"
        , fill "none"
        ]
        [ path
            [ d "M1.69189 1.09747L7.69189 7.09747L13.6919 1.09747"
            , stroke color
            , strokeWidth "2"
            , strokeLinecap "round"
            , strokeLinejoin "round"
            ]
            []
        ]

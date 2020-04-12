module Icons.BackArrow exposing (renderBackArrowIcon)

import Html.Styled exposing (Html)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (d, fill, height, stroke, strokeLinecap, strokeLinejoin, strokeWidth, viewBox, width)


renderBackArrowIcon : String -> Html msg
renderBackArrowIcon color =
    svg
        [ width "16"
        , height "16"
        , viewBox "0 0 16 16"
        , fill "none"
        ]
        [ path
            [ d "M15 8H1M1 8L8 15M1 8L8 1"
            , stroke color
            , strokeWidth "2"
            , strokeLinecap "round"
            , strokeLinejoin "round"
            ]
            []
        ]

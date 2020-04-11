module Icons.Mail exposing (renderMailIcon)

import Html.Styled exposing (Html)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (d, fill, height, stroke, strokeLinecap, strokeLinejoin, strokeOpacity, strokeWidth, viewBox, width)


renderMailIcon : String -> Html msg
renderMailIcon color =
    svg
        [ width "22"
        , height "18"
        , viewBox "0 0 22 18"
        , fill "none"
        ]
        [ path
            [ d "M21.125 2.94543C21.125 1.84543 20.225 0.945435 19.125 0.945435H3.125C2.025 0.945435 1.125 1.84543 1.125 2.94543M21.125 2.94543V14.9454C21.125 16.0454 20.225 16.9454 19.125 16.9454H3.125C2.025 16.9454 1.125 16.0454 1.125 14.9454V2.94543M21.125 2.94543L11.125 9.94543L1.125 2.94543"
            , stroke color
            , strokeOpacity "0.52"
            , strokeWidth "1.5"
            , strokeLinecap "round"
            , strokeLinejoin "round"
            ]
            []
        ]

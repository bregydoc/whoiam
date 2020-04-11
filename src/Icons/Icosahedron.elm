module Icons.Icosahedron exposing (Icosahedron(..), renderIcosahedronIcon, renderIcosahedronIconWithHover)

import Html.Styled exposing (Html)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (d, fill, height, stroke, strokeWidth, viewBox, width)


type Icosahedron
    = Type1
    | Type2
    | Type3


renderIcosahedronIconWithHover : Icosahedron -> String -> String -> Html msg
renderIcosahedronIconWithHover ico colorNormal colorHover =
    case ico of
        Type1 ->
            svg
                [ width "125"
                , height "144"
                , viewBox "0 0 125 144"
                , fill "none"
                ]
                [ path
                    [ d "M1.46948 37.0229L62.0639 1.67627M1.46948 37.0229V107.155M1.46948 37.0229L31.7667 90.0431M1.46948 37.0229H62.4847M62.0639 1.67627L123.5 37.0229M62.0639 1.67627L62.4847 37.0229M123.5 37.0229V107.155M123.5 37.0229H62.4847M123.5 37.0229L92.7819 90.0431M123.5 107.155L62.0639 143.063M123.5 107.155L92.7819 90.0431M62.0639 143.063L1.46948 107.155M62.0639 143.063L31.7667 90.0431M62.0639 143.063L92.7819 90.0431M1.46948 107.155L31.7667 90.0431M31.7667 90.0431H92.7819M31.7667 90.0431L62.4847 37.0229M62.4847 37.0229L92.7819 90.0431"
                    , stroke colorNormal
                    , strokeWidth "1.5"
                    ]
                    []
                ]

        Type2 ->
            svg
                [ width "124"
                , height "144"
                , viewBox "0 0 124 144"
                , fill "none"
                ]
                [ path
                    [ d "M0.984802 37.0229L61.5792 1.67627M0.984802 37.0229V107.155M0.984802 37.0229L61.5792 72.5506M61.5792 1.67627L123.015 37.0229M61.5792 1.67627L31.282 54.4158M61.5792 1.67627L92.2972 54.4158M123.015 37.0229V107.155M123.015 37.0229L61.5792 72.5506M123.015 107.155L61.5792 143.063M123.015 107.155L92.2972 54.4158M123.015 107.155H61.5792M61.5792 143.063L0.984802 107.155M61.5792 143.063V107.155M0.984802 107.155L31.282 54.4158M0.984802 107.155H61.5792M61.5792 72.5506V107.155M31.282 54.4158L61.5792 37.0229L92.2972 54.4158M31.282 54.4158V89.9012L61.5792 107.155M92.2972 54.4158V89.9012L61.5792 107.155"
                    , stroke colorNormal
                    , strokeWidth "1.5"
                    ]
                    []
                ]

        Type3 ->
            svg
                [ width "124"
                , height "144"
                , viewBox "0 0 124 144"
                , fill "none"
                ]
                [ path
                    [ d "M1.125 37.0229L61.7194 1.67627M1.125 37.0229V72.0892M1.125 37.0229H61.7194M61.7194 1.67627L123.155 37.0229M61.7194 1.67627L31.4222 36.8827M61.7194 1.67627L92.4374 36.8827M61.7194 1.67627V37.0229M123.155 37.0229V72.0892M123.155 37.0229H61.7194M123.155 107.155L61.7194 143.063M123.155 107.155V72.0892M123.155 107.155H61.7194M61.7194 143.063L1.125 107.155M61.7194 143.063L92.4374 107.576M61.7194 143.063L31.4222 107.576M61.7194 143.063V107.155M1.125 107.155V72.0892M1.125 107.155H61.7194M123.155 72.0892L92.4374 107.576M123.155 72.0892L92.4374 36.8827M1.125 72.0892L31.4222 36.8827M1.125 72.0892L31.4222 107.576M31.4222 36.8827L92.4374 107.576M31.4222 107.576L92.4374 36.8827"
                    , stroke colorNormal
                    , strokeWidth "1.5"
                    ]
                    []
                ]


renderIcosahedronIcon : Icosahedron -> String -> Html msg
renderIcosahedronIcon ico color =
    renderIcosahedronIconWithHover ico color color

module Github exposing (viewGithub)

import Html.Styled exposing (Html)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (d, fill, height, stroke, strokeLinecap, strokeLinejoin, strokeOpacity, strokeWidth, viewBox, width)


viewGithub : String -> Html msg
viewGithub color =
    svg
        [ width "22"
        , height "23"
        , viewBox "0 0 22 23"
        , fill "none"
        ]
        [ path
            [ d
                "M15.625 21.9722V18.1022C15.6625 17.6254 15.5981 17.146 15.436 16.696C15.2739 16.246 15.0179 15.8356 14.685 15.4922C17.825 15.1422 21.125 13.9522 21.125 8.49223C21.1247 7.09606 20.5877 5.75343 19.625 4.74223C20.0809 3.52073 20.0486 2.17058 19.535 0.972228C19.535 0.972228 18.355 0.622228 15.625 2.45223C13.333 1.83105 10.917 1.83105 8.625 2.45223C5.895 0.622228 4.715 0.972228 4.715 0.972228C4.20138 2.17058 4.16914 3.52073 4.625 4.74223C3.65513 5.76093 3.11752 7.11569 3.125 8.52223C3.125 13.9422 6.425 15.1322 9.565 15.5222C9.236 15.8622 8.98226 16.2676 8.82031 16.7121C8.65835 17.1567 8.59181 17.6303 8.625 18.1022V21.9722M8.625 18.9722C3.625 20.4722 3.625 16.4722 1.625 15.9722L8.625 18.9722Z"
            , stroke color
            , strokeOpacity "0.52"
            , strokeWidth "1.5"
            , strokeLinecap "round"
            , strokeLinejoin "round"
            ]
            []
        ]

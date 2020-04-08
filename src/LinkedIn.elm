module LinkedIn exposing (viewLinkedIn)

import Html.Styled exposing (Html)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (d, fill, height, stroke, strokeLinecap, strokeLinejoin, strokeOpacity, strokeWidth, viewBox, width)


viewLinkedIn : String -> Html msg
viewLinkedIn color =
    svg
        [ width "22"
        , height "21"
        , viewBox "0 0 22 21"
        , fill "none"
        ]
        [ path
            [ d
                "M15.125 6.97223C16.7163 6.97223 18.2424 7.60437 19.3676 8.72959C20.4929 9.85481 21.125 11.3809 21.125 12.9722V19.9722H17.125V12.9722C17.125 12.4418 16.9143 11.9331 16.5392 11.558C16.1641 11.1829 15.6554 10.9722 15.125 10.9722C14.5946 10.9722 14.0859 11.1829 13.7108 11.558C13.3357 11.9331 13.125 12.4418 13.125 12.9722V19.9722H9.125V12.9722C9.125 11.3809 9.75714 9.85481 10.8824 8.72959C12.0076 7.60437 13.5337 6.97223 15.125 6.97223Z"
            , stroke color
            , strokeOpacity "0.52"
            , strokeWidth "1.5"
            , strokeLinecap "round"
            , strokeLinejoin "round"
            ]
            []
        , path
            [ d "M5.125 7.97223H1.125V19.9722H5.125V7.97223Z"
            , stroke color
            , strokeOpacity "0.52"
            , strokeWidth "1.5"
            , strokeLinecap "round"
            , strokeLinejoin "round"
            ]
            []
        , path
            [ d
                "M3.125 4.97223C4.22957 4.97223 5.125 4.0768 5.125 2.97223C5.125 1.86766 4.22957 0.972229 3.125 0.972229C2.02043 0.972229 1.125 1.86766 1.125 2.97223C1.125 4.0768 2.02043 4.97223 3.125 4.97223Z"
            , stroke color
            , strokeOpacity "0.52"
            , strokeWidth "1.5"
            , strokeLinecap "round"
            , strokeLinejoin "round"
            ]
            []
        ]

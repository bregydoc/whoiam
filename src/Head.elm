module Head exposing (Head, headNameAndTag, viewHead)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Theme exposing (mainFonts, secondaryColor)


type Head
    = Head String String


headNameAndTag : String -> String -> Head
headNameAndTag name tag =
    Head name tag


viewHead : Head -> Html msg
viewHead head =
    case head of
        Head name tag ->
            div
                [ css
                    [ fontFamilies mainFonts
                    , marginBottom (rem 3)
                    ]
                ]
                [ h2
                    [ css
                        [ fontSize (rem 3)
                        , margin4 (rem 3) zero zero zero
                        , fontWeight normal
                        , opacity (num 0.52)
                        ]
                    ]
                    [ text "Hello," ]
                , div
                    [ css
                        [ displayFlex
                        , margin4 (rem 0.6) zero (rem 1.4) zero
                        ]
                    ]
                    [ div
                        [ css
                            [ fontSize (rem 3)
                            , fontWeight normal
                            , opacity (num 0.52)
                            ]
                        ]
                        [ text "I'm" ]
                    , h1
                        [ css
                            [ marginTop zero
                            , marginBottom zero
                            , marginLeft (rem 2)
                            , fontSize (rem 3)
                            , fontWeight normal
                            , opacity (num 0.52)
                            , fontWeight bold
                            , opacity (num 1)
                            ]
                        ]
                        [ text name ]
                    ]
                , div
                    [ css
                        [ fontSize (rem 1)
                        , color (hex secondaryColor)
                        , opacity (num 0.64)
                        ]
                    ]
                    [ h3 []
                        [ text tag
                        ]
                    ]
                ]

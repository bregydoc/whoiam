module Head exposing (renderHead)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import SocialNetworks exposing (renderHorizontalSocialNetworks)
import TextResource exposing (Language, mainCorpus, read)
import Theme exposing (Theme)


renderHead : Theme -> Language -> Html msg
renderHead theme lang =
    let
        bigFont =
            case theme.device of
                Theme.Phone ->
                    rem 2

                _ ->
                    rem 3

        smallFont =
            rem 1.2
    in
    div
        [ css
            [ fontFamilies theme.mainFonts
            , if theme.device /= Theme.Desktop then
                marginBottom (rem 2)

              else
                marginBottom (rem 3)
            ]
        ]
        [ h2
            [ css
                [ fontSize bigFont
                , margin4 (rem 3) zero zero zero
                , fontWeight normal
                , opacity (num 0.52)
                ]
            ]
            [ text <| read lang "hello" mainCorpus ++ "," ]
        , div
            [ css
                [ displayFlex
                , margin4 (rem 0.6) zero (rem 1.4) zero
                ]
            ]
            [ div
                [ css
                    [ fontSize bigFont
                    , fontWeight normal
                    , opacity (num 0.52)
                    ]
                ]
                [ text <| read lang "iam" mainCorpus ]
            , h1
                [ css
                    [ marginTop zero
                    , marginBottom zero
                    , marginLeft (rem 2)
                    , fontSize bigFont
                    , fontWeight normal
                    , opacity (num 0.52)
                    , fontWeight bold
                    , opacity (num 1)
                    ]
                ]
                [ text <| read lang "bregyname" mainCorpus ]
            ]
        , div
            [ css
                [ fontSize smallFont
                , color (hex theme.secondaryColor)
                , opacity (num 0.64)
                ]
            ]
            [ h3
                [ css
                    [ fontSize smallFont
                    , fontWeight normal
                    , lineHeight (rem 1.6)
                    ]
                ]
                [ text <| read lang "tagline" mainCorpus
                ]
            ]
        , if theme.device /= Theme.Desktop then
            div
                [ css
                    [ marginTop (rem 2)
                    , displayFlex
                    , if theme.device == Theme.Phone then
                        justifyContent center

                      else
                        justifyContent flexStart
                    ]
                ]
                [ renderHorizontalSocialNetworks theme ]

          else
            div [] []
        ]

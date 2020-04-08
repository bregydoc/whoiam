module Link exposing (Link(..), viewSocialLink)

import Css exposing (..)
import Github exposing (viewGithub)
import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import LinkedIn exposing (viewLinkedIn)
import Mail exposing (viewMail)
import Phone exposing (viewPhone)
import Theme exposing (mainFonts, primaryColor)


type Link
    = Email String
    | Github String
    | LinkedIn String
    | Phone String


viewSocialLayout : String -> Html msg -> Html msg
viewSocialLayout title icon =
    div
        [ css
            [ displayFlex
            , fontFamilies mainFonts
            , fontSize (rem 0.875)
            , alignItems center
            ]
        ]
        [ p [ css [ marginRight (rem 0.875) ] ]
            [ text title
            ]
        , div []
            [ icon ]
        ]


viewSocialLink : Link -> Html msg
viewSocialLink link =
    case link of
        Email email ->
            div []
                [ viewSocialLayout email <| viewMail primaryColor ]

        Github github ->
            div []
                [ viewSocialLayout github <| viewGithub primaryColor ]

        LinkedIn linkedin ->
            div []
                [ viewSocialLayout linkedin <| viewLinkedIn primaryColor ]

        Phone phone ->
            div []
                [ viewSocialLayout phone <| viewPhone primaryColor ]

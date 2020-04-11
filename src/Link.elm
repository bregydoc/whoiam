module Link exposing (Link(..), viewSocialLink)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Icons.Github exposing (renderGithubIcon)
import Icons.LinkedIn exposing (renderLinkedInIcon)
import Icons.Mail exposing (renderMailIcon)
import Icons.Phone exposing (renderPhoneIcon)
import Theme exposing (mainFonts, primaryColor)


type Link
    = Email String
    | Github String
    | LinkedIn String
    | Phone String


viewSocialLayout : msg -> String -> Html msg -> Html msg
viewSocialLayout open title icon =
    div
        [ css
            [ displayFlex
            , fontFamilies mainFonts
            , fontSize (rem 0.875)
            , alignItems center
            , marginBottom (rem 0.8)
            , paddingBottom (rem 0.2)
            , borderBottom3 (px 1) solid transparent
            , hover
                [ cursor pointer
                , borderBottom3 (px 1) solid (hex primaryColor)
                ]
            , transition
                [ Css.Transitions.borderBottom 333
                ]
            ]
        , onClick open
        ]
        [ p
            [ css
                [ marginTop zero
                , marginBottom zero
                , marginRight (rem 0.875)
                ]
            ]
            [ text title
            ]
        , div []
            [ icon ]
        ]


viewSocialLink : Link -> msg -> Html msg
viewSocialLink link open =
    case link of
        Email value ->
            viewSocialLayout open value <| renderMailIcon primaryColor

        Github value ->
            viewSocialLayout open value <| renderGithubIcon primaryColor

        LinkedIn value ->
            viewSocialLayout open value <| renderLinkedInIcon primaryColor

        Phone value ->
            viewSocialLayout open value <| renderPhoneIcon primaryColor

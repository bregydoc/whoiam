module Link exposing (Link(..), renderSocialLink)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Icons.Github exposing (renderGithubIcon)
import Icons.LinkedIn exposing (renderLinkedInIcon)
import Icons.Mail exposing (renderMailIcon)
import Icons.Phone exposing (renderPhoneIcon)
import Theme exposing (Theme)


type Link
    = Email String
    | Github String
    | LinkedIn String
    | Phone String


renderSocialLayout : Theme -> msg -> String -> Html msg -> Html msg
renderSocialLayout theme open title icon =
    div
        [ css
            [ displayFlex
            , fontFamilies theme.mainFonts
            , fontSize (rem 0.875)
            , alignItems center
            , marginBottom (rem 0.8)
            , paddingBottom (rem 0.2)
            , borderBottom3 (px 1) solid transparent
            , hover
                [ cursor pointer
                , borderBottom3 (px 1) solid (hex theme.primaryColor)
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


renderSocialLink : Theme -> Link -> msg -> Html msg
renderSocialLink theme link open =
    case link of
        Email value ->
            renderSocialLayout theme open value <| renderMailIcon theme.primaryColor

        Github value ->
            renderSocialLayout theme open value <| renderGithubIcon theme.primaryColor

        LinkedIn value ->
            renderSocialLayout theme open value <| renderLinkedInIcon theme.primaryColor

        Phone value ->
            renderSocialLayout theme open value <| renderPhoneIcon theme.primaryColor

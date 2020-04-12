module Link exposing (Link(..), renderSocialIconLink, renderSocialLink)

import Css exposing (..)
import Css.Transitions exposing (transition)
import Html.Styled exposing (Html, a, div, p, text)
import Html.Styled.Attributes exposing (css, href)
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


renderSocialLayout : Theme -> String -> String -> Html msg -> Html msg
renderSocialLayout theme openLink title icon =
    a
        [ css
            [ displayFlex
            , fontFamilies theme.mainFonts
            , fontSize (rem 0.875)
            , alignItems center
            , marginBottom (rem 0.8)
            , paddingBottom (rem 0.2)
            , borderBottom3 (px 1) solid transparent
            , textDecoration none
            , color (hex theme.primaryColor)
            , hover
                [ cursor pointer
                , borderBottom3 (px 1) solid (hex theme.primaryColor)
                ]
            , transition
                [ Css.Transitions.borderBottom 333
                ]
            ]
        , href openLink
        , Html.Styled.Attributes.target "_blank"
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


renderOnlyIconSocialLink : Theme -> String -> Html msg -> Html msg
renderOnlyIconSocialLink theme openLink icon =
    a
        [ css
            [ displayFlex
            , fontFamilies theme.mainFonts
            , fontSize (rem 0.875)
            , alignItems center
            , marginBottom (rem 0.8)
            , paddingBottom (rem 0.2)
            , borderBottom3 (px 1) solid transparent
            , textDecoration none
            , color (hex theme.primaryColor)
            , if theme.device == Theme.Phone then
                margin4 zero (rem 1.2) (rem 0.8) (rem 1.2)

              else
                marginRight (rem 2.4)
            , hover
                [ cursor pointer
                , borderBottom3 (px 1) solid (hex theme.primaryColor)
                ]
            , transition
                [ Css.Transitions.borderBottom 333
                ]
            ]
        , href openLink
        , Html.Styled.Attributes.target "_blank"
        ]
        [ div []
            [ icon ]
        ]


renderSocialIconLink : Theme -> Link -> String -> Html msg
renderSocialIconLink theme link openLink =
    case link of
        Email _ ->
            renderOnlyIconSocialLink theme openLink <| renderMailIcon theme.primaryColor

        Github _ ->
            renderOnlyIconSocialLink theme openLink <| renderGithubIcon theme.primaryColor

        LinkedIn _ ->
            renderOnlyIconSocialLink theme openLink <| renderLinkedInIcon theme.primaryColor

        Phone _ ->
            renderOnlyIconSocialLink theme openLink <| renderPhoneIcon theme.primaryColor


renderSocialLink : Theme -> Link -> String -> Html msg
renderSocialLink theme link openLink =
    case link of
        Email value ->
            renderSocialLayout theme openLink value <| renderMailIcon theme.primaryColor

        Github value ->
            renderSocialLayout theme openLink value <| renderGithubIcon theme.primaryColor

        LinkedIn value ->
            renderSocialLayout theme openLink value <| renderLinkedInIcon theme.primaryColor

        Phone value ->
            renderSocialLayout theme openLink value <| renderPhoneIcon theme.primaryColor

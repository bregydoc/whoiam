module SocialNetworks exposing (renderHorizontalSocialNetworks, renderSocialNetworks)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Link exposing (Link, renderSocialIconLink, renderSocialLink)
import Theme exposing (Theme)


bregyEmail =
    "mailto:bregy.malpartida@utec.edu.pe"


bregyGithub =
    "https://github.com/bregydoc"


bregyLinkedIn =
    "https://linkedin.com/in/bregy"


bregyPhone =
    "tel:+51957821858"


renderHorizontalSocialNetworks : Theme -> Html msg
renderHorizontalSocialNetworks theme =
    div
        [ css
            [ displayFlex

            --, flexFlow1 column
            , alignItems center

            --, marginTop (rem 3)
            , justifyContent flexStart
            ]
        ]
        [ bregyEmail
            |> renderSocialIconLink theme (Link.Email "bregy.malpartida@utec.edu.pe")
        , bregyGithub
            |> renderSocialIconLink theme (Link.Github "github.com/bregydoc")
        , bregyLinkedIn
            |> renderSocialIconLink theme (Link.LinkedIn "linkedin/bregy")
        , bregyPhone
            |> renderSocialIconLink theme (Link.Phone "+51957821858")
        ]


renderSocialNetworks : Theme -> Html msg
renderSocialNetworks theme =
    div
        [ css
            [ displayFlex
            , flexFlow1 column
            , alignItems flexEnd
            , marginTop (rem 3)
            ]
        ]
        [ bregyEmail
            |> renderSocialLink theme (Link.Email "bregy.malpartida@utec.edu.pe")
        , bregyGithub
            |> renderSocialLink theme (Link.Github "github.com/bregydoc")
        , bregyLinkedIn
            |> renderSocialLink theme (Link.LinkedIn "linkedin/bregy")
        , bregyPhone
            |> renderSocialLink theme (Link.Phone "+51957821858")
        ]

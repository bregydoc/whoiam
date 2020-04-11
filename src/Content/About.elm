module Content.About exposing (aboutBody)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Icons.Owl exposing (renderDefaultOwlIcon)
import Theme exposing (primaryColor)


aboutBody : Html msg
aboutBody =
    div
        [ css [ displayFlex ]
        ]
        [ div
            [ css
                [ flexGrow (num 1)
                , paddingRight (rem 1)
                , lineHeight (rem 2)
                ]
            ]
            [ text "Work in progress. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac mauris eleifend, pulvinar lorem at, efficitur lacus. Nulla vel lacinia lacus. Etiam tristique nisl tincidunt, faucibus turpis consectetur, imperdiet enim. Sed eros arcu, accumsan vel auctor ac, dictum in velit. Aenean suscipit nunc vel velit sodales, eu vestibulum arcu ultricies. Vivamus lacus lacus, dignissim vel lobortis et, placerat gravida eros. Nam nec lobortis dolor. Morbi ut lacus in tortor pharetra bibendum." ]
        , div []
            [ renderDefaultOwlIcon primaryColor ]
        ]

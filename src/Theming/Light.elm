module Theming.Light exposing (light)

import Theming.Theme exposing (Theme)


light : Theme
light =
    { colors =
        { primary = "#50f2d5"
        , secondary = "#f2506d"
        , ternary = "#50c0f4"
        , black = "#000000"
        , white = "#f0f0ff"
        , background = "#f0f0ff"
        , text = "#000000"
        }
    , fonts =
        { title = "Alegreya Sans, sans-serif"
        , body = "Work Sans, sans-serif"
        , mono = "Oxygen Mono, monospace"
        }
    }



-- font-family: 'Work Sans', sans-serif;
-- font-family: 'Alegreya Sans', sans-serif;
-- font-family: 'Oxygen Mono', monospace;

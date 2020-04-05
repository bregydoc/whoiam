module Theming.Dark exposing (dark)

import Theming.Theme exposing (Theme)


dark : Theme
dark =
    { colors =
        { primary = "#50f2d5"
        , secondary = "#f2506d"
        , ternary = "#50c0f4"
        , black = "#000000"
        , white = "#f0f0ff"
        , background = "#000000"
        , text = "#f0f0ff"
        }
    , fonts =
        { title = "'Alegreya Sans', sans-serif"
        , body = "'Work Sans', sans-serif"
        , mono = "'Oxygen Mono', monospace"
        }
    }

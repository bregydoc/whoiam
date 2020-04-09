module Theme exposing (Theme(..), bgColor, mainFonts, primaryColor, secondaryColor)

-- Theme information


type Theme
    = Light
    | Dark


mainFonts : List String
mainFonts =
    [ "PT Mono", "monospace" ]


primaryColor : String
primaryColor =
    "#50f2d5"


secondaryColor : String
secondaryColor =
    "#ffffff"


bgColor : String
bgColor =
    "#000000"

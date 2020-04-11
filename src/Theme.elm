module Theme exposing (Device(..), Theme, bgColor, mainFonts, primaryColor, secondaryColor)

-- Theme information


type Device
    = Mobile
    | Tablet
    | Desktop


type alias Theme =
    { mainFonts : List String
    , primaryColor : String
    , secondaryColor : String
    , bgColor : String
    , device : Device
    }


lightTheme : Theme
lightTheme =
    { mainFonts = [ "PT Mono", "monospace" ]
    , primaryColor = "#50f2d5"
    , secondaryColor = "#ffffff"
    , bgColor = "#000000"
    , device = Desktop
    }


darkTheme : Theme
darkTheme =
    { mainFonts = [ "PT Mono", "monospace" ]
    , primaryColor = "#000000"
    , secondaryColor = "#50f2d5"
    , bgColor = "#ffffff"
    , device = Desktop
    }


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



-- #291d39

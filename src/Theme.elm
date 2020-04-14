module Theme exposing (ScreenSize(..), Theme, darkTheme, getScreenSize, lightTheme)

-- Theme information


type ScreenSize
    = Phone
    | Tablet
    | Desktop
    | BigDesktop


type alias Theme =
    { mainFonts : List String
    , primaryColor : String
    , secondaryColor : String
    , bgColor : String
    , device : ScreenSize
    }


darkTheme : Theme
darkTheme =
    { mainFonts = [ "PT Mono", "monospace" ]
    , primaryColor = "#50f2d5"
    , secondaryColor = "#ffffff"
    , bgColor = "#000000 "
    , device = Desktop
    }


lightTheme : Theme
lightTheme =
    { mainFonts = [ "PT Mono", "monospace" ]
    , primaryColor = "#291d39"
    , secondaryColor = "#000000"
    , bgColor = "#ffffff"
    , device = Desktop
    }



-- #291d39


getScreenSize : Int -> ScreenSize
getScreenSize width =
    if width <= 600 then
        Phone

    else if width <= 1200 then
        Tablet

    else if width <= 1800 then
        Desktop

    else
        BigDesktop

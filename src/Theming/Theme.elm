module Theming.Theme exposing (..)


type alias Color =
    String


type alias Colors =
    { primary : Color
    , secondary : Color
    , ternary : Color
    , black : Color
    , white : Color
    , background : Color
    , text : Color
    }


type alias Fonts =
    { title : String
    , body : String
    , mono : String
    }


type alias Theme =
    { fonts : Fonts
    , colors : Colors
    }

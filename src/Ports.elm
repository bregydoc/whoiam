port module Ports exposing (StoreSettings, saveSettings)


type alias StoreSettings =
    { language : String
    , theme : String
    }


port saveSettings : StoreSettings -> Cmd msg

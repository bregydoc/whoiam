module Content.Projects exposing (Project, ProjectLanguage(..), languageToString)


type ProjectLanguage
    = Go
    | Python
    | Javascript
    | Elm
    | Dart


languageToString : ProjectLanguage -> String
languageToString lang =
    case lang of
        Go ->
            "Go"

        Python ->
            "Python"

        Javascript ->
            "Javascript"

        Elm ->
            "Elm"

        Dart ->
            "Dart"


type alias Project =
    { name : String
    , link : String
    , description : String
    , language : ProjectLanguage
    , stars : Int
    }

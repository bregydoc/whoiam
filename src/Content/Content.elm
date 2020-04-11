module Content.Content exposing (projects)

import Content.Projects exposing (Project, ProjectLanguage)


projects : List Project
projects =
    [ { name = "bregydoc/pigment"
      , link = "https://github.com/bregydoc/pigment"
      , description = "A simple but useful package to play with colors in flutter"
      , language = Content.Projects.Dart
      , stars = 130
      }
    , { name = "bregydoc/blackholeDB"
      , link = "https://github.com/bregydoc/blackholeDB"
      , description = "BlackholeDB is a simple distributed key-value DB based on IPFS protocol"
      , language = Content.Projects.Go
      , stars = 112
      }
    , { name = "bregydoc/gtranslate"
      , link = "https://github.com/bregydoc/gtranslate"
      , description = "Google translate API for unlimited and free translations, gtranslate generates the necessary token to use the Google Translate API for free"
      , language = Content.Projects.Go
      , stars = 95
      }
    , { name = "bregydoc/bcidatasetIV2a"
      , link = "https://github.com/bregydoc/bcidatasetIV2a"
      , description = "This is a repository for BCI Competition 2008 dataset IV 2a fixed and optimized for python and numpy. This dataset is related with motor imagery"
      , language = Content.Projects.Python
      , stars = 28
      }
    , { name = "minskylab/neocortex"
      , link = "https://github.com/minskylab/neocortex"
      , description = "\u{1F9E0}Neocortex is a tool to connect your cognitive service (e.g. DialogFlow) \u{1F916} with your communication channels (like facebook) 📞to create amazing bots"
      , language = Content.Projects.Go
      , stars = 19
      }
    , { name = "minskylab/plutus"
      , link = "https://github.com/minskylab/plutus"
      , description = "Plutus is a modern little tool to manage your payments, charges and invoices of your products."
      , language = Content.Projects.Go
      , stars = 2
      }
    ]

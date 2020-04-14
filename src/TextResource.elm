module TextResource exposing (Corpus(..), Language(..), TextResource, mainCorpus, read)

import Dict exposing (Dict)


type Language
    = EN
    | ES


type alias TextResource =
    List ( Language, String )


type Corpus
    = Corpus (Dict String TextResource)


read : Language -> String -> Corpus -> String
read lang res corpus =
    case corpus of
        Corpus resources ->
            case Dict.get res resources of
                Just resource ->
                    let
                        text =
                            List.filter (\( l, _ ) -> l == lang) resource
                                |> List.head

                        finalTextResource =
                            case text of
                                Just ( _, t ) ->
                                    t

                                Nothing ->
                                    res
                    in
                    finalTextResource

                Nothing ->
                    res


mainCorpus : Corpus
mainCorpus =
    Corpus <|
        Dict.fromList
            [ ( "bregyname"
              , [ ( EN, "Bregy Malpartida" )
                , ( ES, "Bregy Malpartida" )
                ]
              )
            , ( "hello"
              , [ ( EN, "Hello" )
                , ( ES, "Hola" )
                ]
              )
            , ( "iam"
              , [ ( EN, "I'm" )
                , ( ES, "Soy" )
                ]
              )
            , ( "tagline"
              , [ ( EN, "Passionate about human knowledge" )
                , ( ES, "Apasionado por el conocimiento humano" )
                ]
              )
            , ( "settings"
              , [ ( EN, "Settings" )
                , ( ES, "Configuración" )
                ]
              )
            , ( "settings_colortheme"
              , [ ( EN, "Color Theme" )
                , ( ES, "Tema" )
                ]
              )
            , ( "settings_colortheme_light"
              , [ ( EN, "Light" )
                , ( ES, "Claro" )
                ]
              )
            , ( "settings_colortheme_dark"
              , [ ( EN, "Dark" )
                , ( ES, "Oscuro" )
                ]
              )
            , ( "settings_language"
              , [ ( EN, "Language" )
                , ( ES, "Idioma" )
                ]
              )
            , ( "settings_language_spanish"
              , [ ( EN, "Spanish" )
                , ( ES, "Español" )
                ]
              )
            , ( "settings_language_english"
              , [ ( EN, "English" )
                , ( ES, "Inglés" )
                ]
              )
            , ( "settings_close"
              , [ ( EN, "Close" )
                , ( ES, "Cerrar" )
                ]
              )
            , ( "aboutme"
              , [ ( EN, "About Me" )
                , ( ES, "Acerca De Mi" )
                ]
              )
            , ( "mywork"
              , [ ( EN, "My work" )
                , ( ES, "Mi Trabajo" )
                ]
              )
            , ( "myinterests"
              , [ ( EN, "My Interests" )
                , ( ES, "Mis Intereses" )
                ]
              )
            , ( "minsky"
              , [ ( EN, "Minsky" )
                , ( ES, "Minsky" )
                ]
              )
            , ( "aboutme_content"
              , [ ( EN, "Hello, My name is Bregy Malpartida, I'm from Perú and currently I'm studing Electrical Enginiering..." )
                , ( ES, "Me llamo Bregy Malpartida, soy de Perú, actualmente me encuentro estudiando la carrera de ingeniería electrónica..." )
                ]
              )
            , ( "mywork_personal"
              , [ ( EN, "Personal Projects" )
                , ( ES, "Projectos Personales" )
                ]
              )
            , ( "mywork_research"
              , [ ( EN, "Research" )
                , ( ES, "Investigación" )
                ]
              )
            , ( "mywork_industrial"
              , [ ( EN, "Industrial Experience" )
                , ( ES, "Experiencia Laboral" )
                ]
              )
            , ( "myinterests_programming"
              , [ ( EN, "Programming" )
                , ( ES, "Programación" )
                ]
              )
            , ( "myinterests_development"
              , [ ( EN, "Development" )
                , ( ES, "Desarrollo" )
                ]
              )
            , ( "myinterests_biology"
              , [ ( EN, "Biology" )
                , ( ES, "Biología" )
                ]
              )
            , ( "myinterests_humanmind"
              , [ ( EN, "Human Mind & Learing" )
                , ( ES, "Mente Humana y Aprendizaje" )
                ]
              )
            , ( "myinterests_science"
              , [ ( EN, "Science" )
                , ( ES, "Ciéncia" )
                ]
              )
            , ( "minsky_summary"
              , [ ( EN, "Minsky is a Peruvian initiative to boost our country with technology. The main goal of Minsky is to generate digital products for the community based on open source and modern technologies stack." )
                , ( ES, "Minsky es una iniciativa peruana para impulsar nuestro país con tecnología. El objetivo principal de Minsky es generar productos digitales para la comunidad basados en código abierto y tecnologías modernas." )
                ]
              )
            , ( "minsky_action"
              , [ ( EN, "See more at our homepage" )
                , ( ES, "Enterate más en nuestra página" )
                ]
              )
            , ( "seemore"
              , [ ( EN, "See More" )
                , ( ES, "Ver Más" )
                ]
              )
            , ( "stars"
              , [ ( EN, "Stars" )
                , ( ES, "Estrellas" )
                ]
              )
            , ( "programminglang"
              , [ ( EN, "Language" )
                , ( ES, "Lenguaje" )
                ]
              )
            ]

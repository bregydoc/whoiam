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
            , ( "aboutme_contentmain"
              , [ ( EN, "I am dedicated to creating things, especially digital things. In recent years I have focused on research and development of computer systems with a focus on emerging technologies. I am convinced that at present we can strongly impact with these technologies on the reality of our country, taking advantage of the opportunities offered by this time of interconnection and virtuality." )
                , ( ES, "Me dedico a crear cosas, en especial cosas digitales. En los últimos años me he centrado en la investigación y desarrollo de sistemas computacionales con un enfoque en tecnologías emergentes. Estoy convencido de que en la actualidad podemos impactar fuertemente con dichas tecnologías en la realidad de nuestro país aprovechando las oportunidades que nos brinda esta época de interconexión y virtualidad." )
                ]
              )
            , ( "aboutme_contentpersonaltitle"
              , [ ( EN, "Something more personal" )
                , ( ES, "Algo más personal" )
                ]
              )
            , ( "aboutme_contentpersonal"
              , [ ( EN, "For as long as I can remember I have been interested in how things work, I have always felt the need to know the details behind something in order to be able to recreate it. In a completely intentional way, being in high school, I discovered the world of programming and electronics, since then I have had abstraction as my main knowledge tool (although I would not know until several years later). I have had the opportunity to collaborate in some multidisciplinary projects and I have noticed that there is an inherent continuity in human knowledge and that it is necessary for us to be aware of this as it is necessary to face the future that is coming." )
                , ( ES, "Desde que recuerdo he estado interesado en el funcionamiento de las cosas, siempre he sentido la necesidad de saber los detalles detrás de algo en funcionamiento con la finalidad de poder recrearlo. De manera totalmente intencionada, estando en la secundaria, descubrí el mundo de la programación y la electrónica, desde ese entonces he tenido como principal herramienta de conocimiento a la abstracción (aunque no lo sabría hasta pasados varios años). He tenido la oportunidad de colaborar en algunos proyectos multidisciplinarios y he podido notar que existe una continuidad inherente en el conocimiento humano y que es necesario que seamos conscientes de eso ya que es algo que muy útil para enfrentar el futuro que se adviene." )
                ]
              )
            , ( "aboutme_contentcite"
              , [ ( EN, "The noblest pleasure is the joy of understanding" )
                , ( ES, "El placer más noble es el júbilo de comprender." )
                ]
              )
            , ( "aboutme_contentciteleonardo"
              , [ ( EN, "Leonardo da Vinci" )
                , ( ES, "Leonardo da Vinci" )
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
            , ( "myinterests_programmingwhy"
              , [ ( EN, "About how to automate whatever" )
                , ( ES, "Sobre como automatizar absolutamente todo" )
                ]
              )
            , ( "myinterests_development"
              , [ ( EN, "Development" )
                , ( ES, "Desarrollo" )
                ]
              )
            , ( "myinterests_developmentwhy"
              , [ ( EN, "About how works the things under the hood" )
                , ( ES, "Sobre como funcionan las cosas por detrás" )
                ]
              )
            , ( "myinterests_biology"
              , [ ( EN, "Biology" )
                , ( ES, "Biología" )
                ]
              )
            , ( "myinterests_biologywhy"
              , [ ( EN, "About how we work" )
                , ( ES, "Sobre como funcionamos" )
                ]
              )
            , ( "myinterests_humanmind"
              , [ ( EN, "Human Mind & Learing" )
                , ( ES, "Mente Humana y Aprendizaje" )
                ]
              )
            , ( "myinterests_humanmindwhy"
              , [ ( EN, "About how we think" )
                , ( ES, "Sobre como pensamos" )
                ]
              )
            , ( "myinterests_science"
              , [ ( EN, "Science" )
                , ( ES, "Ciéncia" )
                ]
              )
            , ( "myinterests_sciencewhy"
              , [ ( EN, "About how we understand" )
                , ( ES, "Sobre como entendemos" )
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

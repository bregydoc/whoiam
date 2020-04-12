module Icons.Owl exposing (renderDefaultOwlIcon, renderOwlIcon, renderOwlIconWithScale)

import Html.Styled exposing (Html)
import Svg.Styled exposing (path, svg)
import Svg.Styled.Attributes exposing (d, fill, height, stroke, strokeWidth, viewBox, width)


renderOwlIconWithScale : Float -> String -> Html msg
renderOwlIconWithScale scale color =
    renderOwlIcon ( round <| scale * 344, round <| scale * 341 ) color


renderOwlIcon : ( Int, Int ) -> String -> Html msg
renderOwlIcon ( w, h ) color =
    svg
        [ fill "none"
        , width (String.fromInt w)
        , height (String.fromInt h)
        , viewBox "0 0 344 341"
        ]
        [ path
            [ d "M254.517 46.7582L296.462 17.3319M254.517 46.7582L296.462 40.7428M254.517 46.7582L231.919 86.264M254.517 46.7582V74.396M254.517 46.7582L223.493 35.7826M254.517 46.7582L172.84 135.751M254.517 46.7582L261.291 38.7752M281.83 14.5682L343.121 1.39955M281.83 14.5682L296.462 17.3319M281.83 14.5682L261.291 38.7752M343.121 1.39955L296.462 17.3319M343.121 1.39955L326.181 15.2701M296.462 40.7428V17.3319M296.462 40.7428L326.181 15.2701M231.919 86.264L254.517 74.396M231.919 86.264L280.529 96.5063M231.919 86.264L172.84 135.751M254.517 74.396L290.121 71.4697M254.517 74.396L322.149 25.1356M280.529 96.5063L290.121 71.4697M280.529 96.5063L301.823 64.6403M280.529 96.5063L320.081 106.557M280.529 96.5063L208.006 123.973M280.529 96.5063L277.624 101.773M280.529 96.5063L300.902 147.253M290.121 71.4697L322.149 25.1356M290.121 71.4697L301.823 64.6403M322.149 25.1356L326.181 15.2701M322.149 25.1356L301.823 64.6403M301.823 64.6403L320.081 106.557M301.823 64.6403L335.53 111.635M320.081 106.557L335.53 111.635M320.081 106.557L301.175 147.934M320.081 106.557L319.109 122.006M335.53 111.635L319.109 122.006M301.175 147.934L317.748 123.973M301.175 147.934L329.912 153.011M301.175 147.934L263.58 187.366M301.175 147.934L300.902 147.253M319.109 122.006L317.748 123.973M317.748 123.973L329.912 153.011M329.912 153.011L294.477 189.31M329.912 153.011L308.089 253.05M294.477 189.31L263.58 187.366M294.477 189.31L308.089 253.05M294.477 189.31L284.97 236.305M294.477 189.31L274.23 221.396M263.58 187.366L274.23 221.396M263.58 187.366L240.082 185.173M308.089 253.05L292.335 241.639M284.97 236.305L279.461 257.263M284.97 236.305L292.335 241.639M267.685 231.768L279.461 257.263M267.685 231.768L274.23 221.396M267.685 231.768L240.082 197.766M267.685 231.768L210.144 208.933M267.685 231.768L241.508 271.186M267.685 231.768L251.748 292.002M267.685 231.768L262.653 271.656M279.461 257.263L278.596 285.244M279.461 257.263L291.344 247.972M279.461 257.263L292.335 241.639M279.461 257.263L262.653 271.656M278.596 285.244L291.344 247.972M278.596 285.244L262.653 271.656M291.344 247.972L292.335 241.639M240.082 185.173V197.766M240.082 185.173L210.144 208.933M240.082 185.173L218.936 175.431M240.082 185.173L203.966 182.084M240.082 197.766L210.144 208.933M210.144 208.933L241.508 271.186M210.144 208.933L218.936 289.957M210.144 208.933L203.966 182.084M241.508 271.186L218.936 289.957M241.508 271.186L245.299 277.57M218.936 289.957L210.689 299.556M218.936 289.957L172.107 238.962M218.936 289.957L229.939 312.463M218.936 289.957L207.458 298.895M203.966 182.084L218.936 175.431M203.966 182.084L191.136 153.011M203.966 182.084L184.601 210.087M191.136 153.011L218.936 175.431M191.136 153.011L203.966 147.934M191.136 153.011L172.84 135.751M191.136 153.011L189.228 172.327M218.936 175.431L203.966 147.934M203.966 147.934L208.006 123.973M208.006 123.973L172.84 135.751M208.006 123.973L277.624 101.773M172.84 135.751V66.6142M172.84 135.751L210.144 71.4697M172.84 135.751L191.136 66.6142M172.84 135.751L134.486 71.4697M172.84 135.751L155.399 66.6142M172.84 135.751L90.5771 46.1119M172.84 135.751L113.206 86.264M172.84 135.751L55.3745 71.4697M172.84 135.751L138.636 123.875M172.84 135.751L154.784 152.533M172.84 135.751L172.107 238.962M172.84 135.751L189.228 172.327M172.84 135.751L157.54 172.327M277.624 101.773L300.902 147.253M172.84 66.6142H191.136M172.84 66.6142V44.0967M172.84 66.6142H155.399M191.136 66.6142L210.144 71.4697M191.136 66.6142L172.84 44.0967M210.144 71.4697L223.493 35.7826M210.144 71.4697L172.84 44.0967M223.493 35.7826L172.84 44.0967M223.493 35.7826L217.668 33.1811M172.84 44.0967L217.668 33.1811M172.84 44.0967L134.486 71.4697M172.84 44.0967L155.399 66.6142M172.84 44.0967L121.954 35.7826M172.84 44.0967L127.659 33.1811M217.668 33.1811L261.291 38.7752M134.486 71.4697L155.399 66.6142M134.486 71.4697L121.954 35.7826M121.954 35.7826L127.659 33.1811M121.954 35.7826L90.5771 46.1119M121.954 35.7826H106.085M127.659 33.1811L106.085 35.7826M90.5771 46.1119V75.2066M90.5771 46.1119L113.206 86.264M90.5771 46.1119L84.9144 39.7004M90.5771 46.1119L47.9259 16.9578M90.5771 75.2066L113.206 86.264M90.5771 75.2066L18.3992 15.4681M90.5771 75.2066L55.3745 71.4697M90.5771 75.2066L47.9259 16.9578M84.9144 39.7004L106.085 35.7826M84.9144 39.7004L63.8162 15.4681M63.8162 15.4681L1 1.0675M63.8162 15.4681L47.9259 16.9578M1 1.0675L47.9259 16.9578M1 1.0675L18.3992 15.4681M18.3992 15.4681L55.3745 71.4697M18.3992 15.4681L33.5254 46.1119M55.3745 71.4697L64.3376 98.0789M55.3745 71.4697L33.5254 46.1119M64.3376 98.0789L26.3251 106.092M64.3376 98.0789L44.5459 64.4717M64.3376 98.0789L44.2921 147.164M64.3376 98.0789L138.636 123.875M33.5254 46.1119L44.5459 64.4717M44.2921 147.164L26.3251 106.092M44.2921 147.164L26.3251 123.111M44.2921 147.164L81.3376 187.001M44.2921 147.164L15.4073 153.177M26.3251 106.092L44.5459 64.4717M26.3251 106.092V123.111M26.3251 106.092L10.4348 110.81M44.5459 64.4717L10.4348 110.81M10.4348 110.81L26.3251 123.111M26.3251 123.111L15.4073 153.177M81.3376 187.001L106.571 185.927M81.3376 187.001L103.35 197.739M81.3376 187.001L15.4073 153.177M81.3376 187.001L51.4864 188.719M81.3376 187.001L70.8145 222.436M106.571 185.927L126.436 173.579M106.571 185.927L136.1 210.087M106.571 185.927L103.35 197.739M126.436 173.579L140.718 147.271M126.436 173.579L140.718 183.78M126.436 173.579L154.784 152.533M140.718 147.271L138.636 123.875M140.718 147.271L154.784 152.533M154.784 152.533L140.718 183.78M154.784 152.533L157.54 172.327M140.718 183.78L136.1 210.087M140.718 183.78L163.315 213.82M136.1 210.087L103.35 271.186M136.1 210.087L75.9687 232.1M136.1 210.087L125.37 289.863M136.1 210.087L172.107 238.962M136.1 210.087L135.859 300.043M103.35 197.739L70.8145 222.436M103.35 197.739L75.9687 232.1M15.4073 153.177L51.4864 188.719M15.4073 153.177L37.4584 252.269L52.5118 241.709M51.4864 188.719L70.8145 222.436M51.4864 188.719L61.1259 235.666M65.553 257.226L75.9687 232.1M65.553 257.226L61.1259 235.666M65.553 257.226L66.7667 285.036M65.553 257.226L83.1502 272.111M65.553 257.226L103.35 271.186M75.9687 232.1L103.35 271.186M61.1259 235.666L52.5118 241.709M61.1259 235.666L66.7667 285.036M52.5118 241.709L66.7667 285.036M66.7667 285.036L83.1502 272.111M83.1502 272.111L96.5937 287.245M83.1502 272.111L103.35 271.186M83.1502 272.111L115.406 334.544M96.5937 287.245L100.356 277.57M96.5937 287.245L115.406 334.544M100.356 277.57L115.406 334.544M100.356 277.57L103.35 271.186M115.406 334.544V310.357M115.406 334.544L135.859 300.043M115.406 334.544L125.37 289.863M115.406 310.357L108.687 274.613M115.406 310.357L125.37 289.863M108.687 274.613L103.35 271.186M108.687 274.613L125.37 289.863M135.859 300.043L125.37 289.863M135.859 300.043L137.289 297.634M172.107 238.962V339.376M172.107 238.962L137.289 297.634M172.107 238.962L163.315 213.82M172.107 238.962L184.601 210.087M172.107 238.962L207.458 298.895M172.107 339.376L137.289 297.634M172.107 339.376L207.458 298.895M163.315 213.82L157.54 172.327M184.601 210.087L189.228 172.327M210.689 299.556L207.458 298.895M210.689 299.556L229.939 336.112M229.939 312.463L245.299 277.57M229.939 312.463V336.112M245.299 277.57L251.748 292.002M245.299 277.57L229.939 336.112M251.748 292.002L229.939 336.112M251.748 292.002L262.653 271.656"
            , stroke color
            , strokeWidth "1.5"
            ]
            []
        ]


renderDefaultOwlIcon : String -> Html msg
renderDefaultOwlIcon color =
    renderOwlIcon ( 344, 341 ) color

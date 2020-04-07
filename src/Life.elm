module Life exposing (birthDay, lifePercent, lifeSpan)

import Time exposing (Month(..))
import Time.Extra


birthDay : Time.Zone -> Time.Posix
birthDay zone =
    Time.Extra.Parts 1996 Feb 18 12 0 0 0 |> Time.Extra.partsToPosix zone


lifeSpan : Int
lifeSpan =
    86



-- HELPERS


lifePercent : Time.Zone -> Time.Posix -> Float
lifePercent zone now =
    let
        age =
            Time.Extra.diff Time.Extra.Year zone (birthDay zone) now
    in
    toFloat age / toFloat lifeSpan

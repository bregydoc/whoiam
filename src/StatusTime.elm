module StatusTime exposing (timeToDate, timeToStr)

import Time exposing (Month(..), millisToPosix, utc)
import Time.Extra as Time


timeToStr : Time.Zone -> Time.Posix -> String
timeToStr zone time =
    let
        hour =
            Time.toHour zone time
                |> completeTwoDigits

        minute =
            Time.toMinute zone time
                |> completeTwoDigits

        second =
            Time.toSecond zone time
                |> completeTwoDigits
    in
    hour ++ ":" ++ minute ++ ":" ++ second


timeToDate : Time.Zone -> Time.Posix -> String
timeToDate zone time =
    let
        day =
            Time.toDay zone time
                |> completeTwoDigits

        month =
            Time.toMonth zone time

        year =
            Time.toYear zone time
    in
    day ++ " " ++ monthToString month ++ " " ++ String.fromInt year


completeTwoDigits : Int -> String
completeTwoDigits num =
    if num < 10 then
        "0" ++ String.fromInt num

    else
        String.fromInt num


monthToString : Time.Month -> String
monthToString month =
    case month of
        Jan ->
            "Jan"

        Feb ->
            "Feb"

        Mar ->
            "Mar"

        Apr ->
            "Apr"

        May ->
            "May"

        Jun ->
            "Jun"

        Jul ->
            "Jul"

        Aug ->
            "Aug"

        Sep ->
            "Sep"

        Oct ->
            "Oct"

        Nov ->
            "Nov"

        Dec ->
            "Dec"

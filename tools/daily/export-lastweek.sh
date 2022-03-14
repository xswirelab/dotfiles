#!/usr/bin/env osascript
tell application "Daily"

set LastWeek to (current date) - (7 * days)
set Today to (current date)

set ShortLastWeekDate to short date string of LastWeek
set ShortTodayDate to short date string of Today

set Location to "/Users/wirelab/Documents/"

export csv with report "summary" from LastWeek to Today with delimiter "," with duration format "H:mm:ss" to file (POSIX file (Location & ShortLastWeekDate & "-" & ShortTodayDate & "-summary.csv")) with time rounding
end tell
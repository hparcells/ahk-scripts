; https://autohotkey.com/board/topic/81996-random-date-function/?p=521171

randomDate(StartDate, EndDate, DateFormat="yyyy-MM-dd") {
  StringReplace StartDate, StartDate, /,, A
  StringReplace EndDate, EndDate, /,, A
  EndDate -= StartDate, days
  Random RandDays, 0, EndDate
  StartDate += RandDays, days
  FormatTime RandDate, %StartDate%, %DateFormat%
  return RandDate
}

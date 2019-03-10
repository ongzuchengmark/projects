#' Finding out if specified date is a holiday
#'
#' This function answers the question: Is the specified date a holiday in the specified country and year?
#'
#' This function will return TRUE if the specified date is a holiday in the specified country and year, FALSE if the specified date is not a holiday in the specified country and year.
#'
#' @param dateofinterest a single date in the format "YYYY-MM-DD".
#' @param country a single ISO 3166 country code from the 'countrycode' dataset in this package.
#' @param api_key personal CalendarIndex API key
#' @import stringr httr dplyr
#' @export
#'
#' @examples
#' isitholiday("2018-12-31", "US", Sys.getenv("CALENDARINDEX_API_KEY"))
#' isitholiday("2016-08-06", "AD", api_key = Sys.getenv("CALENDARINDEX_API_KEY"))

isitholiday <- function(dateofinterest = "2018-01-01", country = "US", api_key = Sys.getenv("CALENDARINDEX_API_KEY")) {
  year <- str_split(dateofinterest, "-")[[1]][1]
  url <- str_c("https://www.calendarindex.com/api/v1/holidays", "?country=", {country}, "&year=", {year}, "&api_key=", {api_key})
  get_result <- GET(url)
  if (http_status(get_result)$category != "Success") {
    warning("The request has produced an error")
  } else {
    get_content <- content(get_result)
    x <- get_content$response$holidays
    df1 <- data.frame(matrix(ncol = 1, nrow = 0))
    colnames(df1) <- "date"
    for (i in 1:length(get_content$response$holidays)) {
      y <- data.frame(matrix(ncol = 1, nrow = 1))
      colnames(y) <- "date"
      date <- str_split(x[[i]]$date, " ")[[1]][1]
      y[1,1] <- date
      df1 <- rbind(df1, y)
    }
    Sys.sleep(0.1)
    list <- unlist(df1$date)
    return({dateofinterest} %in% list)
  }
}

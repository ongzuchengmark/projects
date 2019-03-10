#' Generating a dataframe of all holidays in a year
#'
#' This function will generate a dataframe containing a list of all holidays containing all the holidays that are taking place within a specified year in a specified country.
#'
#' The dataframe will include the date of holiday, the country, the name of holiday, and the type of holiday (public, observance, optional, etc).
#'
#' @param country a single ISO 3166 country code or a list of ISO 3166 country codes from the 'countrycode' dataset in this package.
#' @param year the year of interest
#' @param api_key personal CalendarIndex API key
#' @import stringr httr dplyr
#' @export
#' @examples
#' holidaylist("US", "2018", Sys.getenv("CALENDARINDEX_API_KEY"))
#' holidaylist(c("US", "AD"), "2016", api_key = Sys.getenv("CALENDARINDEX_API_KEY"))

holidaylist <- function(country = c("US"), year = "2018", api_key = Sys.getenv("CALENDARINDEX_API_KEY")) {
  df <- data.frame(matrix(ncol = 4, nrow = 0))
  for (i in 1:length(country)) {
    countryname <- country[i]
    url <- str_c("https://www.calendarindex.com/api/v1/holidays", "?country=", {countryname}, "&year=", {year}, "&api_key=", {api_key})
    get_result <- GET(url)
    if (http_status(get_result)$category != "Success") {
      warning("The request has produced an error")
    } else {
      get_content <- content(get_result)
      x <- get_content$response$holidays
      df1 <- data.frame(matrix(ncol = 4, nrow = 0))
      for (i in 1:length(get_content$response$holidays)) {
        y <- data.frame(matrix(ncol = 4, nrow = 1))
        date <- str_split(x[[i]]$date, " ")[[1]][1]
        y[1,1] <- date
        y[1,2] <- countryname
        y[1,3] <- x[[i]]$name
        y[1,4] <- x[[i]]$type
        df1 <- rbind(df1, y)
      }
      df <- rbind(df, df1)
      Sys.sleep(0.1)
    }
  }
  colnames(df) <- c("date", "country", "name", "type")
  df$date <- as.Date(df$date, "%Y-%m-%d")
  df <- arrange(df, country)
  return(df)
}

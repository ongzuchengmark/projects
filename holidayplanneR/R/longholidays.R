#' Identifying long blocks of holidays
#'
#' This function will identify the long holidays taking place in the specified country in the specified year, in a specified year, which are mainly due to public holidays on Fridays or Mondays.
#'
#' The dataframe will include the specified year, the country, the start date and day of the long holiday, the end date and day of the long holiday, the total length of the long holiday. Only public holidays are considered (observances and optional holidays are excluded).
#'
#' @param country a single ISO 3166 country code or a list of ISO 3166 country codes from the 'countrycode' dataset in this package.
#' @param year the year of interest
#' @param api_key personal CalendarIndex API key
#' @import stringr httr dplyr
#' @export
#' @examples
#' longholidays("US", "2018", Sys.getenv("CALENDARINDEX_API_KEY"))
#' longholidays(c("US", "AD"), "2016", api_key = Sys.getenv("CALENDARINDEX_API_KEY"))

longholidays <- function(country = c("US"), year = "2018", api_key = Sys.getenv("CALENDARINDEX_API_KEY")) {
  firstday <- str_c({year}, "-01-01")
  lastday <- str_c({year}, "-12-31")
  dates <- seq.Date(as.Date(firstday),as.Date(lastday), by="1 day")
  dates1 <- dates[weekdays(dates)=="Saturday" | weekdays(dates)=="Sunday"]
  final_df <- data.frame(matrix(ncol = 6, nrow = 0))
  colnames(final_df) <- c("startdate", "enddate", "startday", "endday", "length", "country")
  final_df$startdate <- as.Date(final_df$startdate)
  final_df$enddate <- as.Date(final_df$enddate)
  for (i in 1:length(country)) {
    allholidays <- as.data.frame(dates1)
    countryname <- country[i]
    url <- str_c("https://www.calendarindex.com/api/v1/holidays", "?country=", {countryname}, "&year=", {year}, "&api_key=", {api_key})
    get_result <- GET(url)
    if (http_status(get_result)$category != "Success") {
      warning("The request has produced an error")
    } else {
      get_content <- content(get_result)
      x <- get_content$response$holidays
      for (i in 1:length(x)) {
        holidaydates <- data.frame(matrix(ncol = 1, nrow = 1))
        colnames(holidaydates) <- "dates1"
        if (x[[i]]$type == "public") {
          holidaydates[1,1] <- str_split(x[[i]]$date, " ")[[1]][1]
          holidaydates$dates1 <- as.Date(holidaydates$dates1)
          allholidays <- rbind(allholidays, holidaydates)
        }
      }
      allholidays <- arrange(allholidays, dates1)
      allholidays$consec <- c(NA, lag = diff(allholidays$dates1)==1)
      enddate <- data.frame(matrix(ncol = 1, nrow = 0))
      colnames(enddate) <- "enddate"
      enddate$enddate <- as.Date(enddate$enddate)
      enddate1 <- data.frame(matrix(ncol = 1, nrow = 1))
      colnames(enddate1) <- "enddate"
      enddate1$enddate <- as.Date(enddate1$enddate)
      startdate <- data.frame(matrix(ncol = 1, nrow = 0))
      colnames(startdate) <- "startdate"
      startdate$startdate <- as.Date(startdate$startdate)
      startdate1 <- data.frame(matrix(ncol = 1, nrow = 1))
      colnames(startdate1) <- "startdate"
      startdate1$startdate <- as.Date(startdate1$startdate)
      if (isTRUE(allholidays$consec[2])) {
        startdate1[1,1] <- allholidays$dates1[1]
        startdate <- rbind(startdate, startdate1)
      }
      for (i in 2:(length(allholidays$consec)-1)) {
        if ((isTRUE(allholidays$consec[i])) & (isFALSE(allholidays$consec[i+1]))) {
          enddate1[1,1] <- allholidays$dates1[i]
          enddate <- rbind(enddate, enddate1)
        }
      }
      if (isTRUE(allholidays$consec[length(allholidays$dates1)])) {
        enddate1[1,1] <- allholidays$dates1[length(allholidays$dates1)]
        enddate <- rbind(enddate, enddate1)
      }
      for (i in 2:length(allholidays$consec)) {
        if ((isFALSE(allholidays$consec[i])) & (isFALSE(allholidays$consec[i+1]))) {
          enddate1[1,1] <- allholidays$dates1[i]
          enddate <- rbind(enddate, enddate1)
        }
      }
      for (i in 2:length(allholidays$consec)) {
        if ((isFALSE(allholidays$consec[i])) & (isTRUE(allholidays$consec[i+1]))) {
          startdate1[1,1] <- allholidays$dates1[i]
          startdate <- rbind(startdate, startdate1)
        }
      }
      for (i in 2:length(allholidays$consec)) {
        if ((isFALSE(allholidays$consec[i])) & (isFALSE(allholidays$consec[i+1]))) {
          startdate1[1,1] <- allholidays$dates1[i]
          startdate <- rbind(startdate, startdate1)
        }
      }
      if (isFALSE(allholidays$consec[2])) {
        startdate1[1,1] <- allholidays$dates1[1]
        startdate <- rbind(startdate, startdate1)
        enddate1[1,1] <- allholidays$dates1[1]
        enddate <- rbind(enddate, enddate1)
      }
      country_df <- cbind(startdate, enddate)
      country_df$startday <- weekdays(country_df$startdate)
      country_df$endday <- weekdays(country_df$enddate)
      country_df$length <- country_df$enddate - country_df$startdate + 1
      country_df$country <- rep({countryname})
      final_df <- rbind(final_df, country_df)
    }
  }
  final_df <- final_df %>%
    select("country", "startdate", "startday", "enddate", "endday", "length") %>%
    arrange(country, desc(length), startdate)
  return(final_df)
}

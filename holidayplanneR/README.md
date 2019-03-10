
<!-- README.md is generated from README.Rmd. Please edit that file -->
holidayplanneR
==============

The goal of holidayplanneR is to provide some functions that can allow users to gain useful information and/or more structured information about holidays.

Details and Recommendation
--------------------------

The function requires countries to be specified in the form of ISO 3166 country code and the country has to be within the 125 selected countries that are supported by the CalendarIndex API. The list of the 125 countries and their respective ISO 3166 country code be found in the countrycodes file in the data folder of this R package.

Users can sign up for their free CalendarIndex API key from this url: <https://www.calendarindex.com/signup?plan=free>

The CalendarIndex API key is required for all three functions in this holidayplanneR package.

It would be recommended, but not necessary, for user to store his/her CalendarIndex API in the .Renviron file as CALENDARINDEX\_API\_KEY.

Example
-------

This is a basic example which shows you how to use the function isitholiday:

``` r
isitholiday("2018-12-31", "US", Sys.getenv("CALENDARINDEX_API_KEY"))
#> [1] TRUE
```

This is a basic example which shows you how to use the function holidaylist for one specific country:

``` r
holidaylist("US", "2018", Sys.getenv("CALENDARINDEX_API_KEY"))
#>          date country                             name       type
#> 1  2018-01-01      US                   New Year's Day     public
#> 2  2018-01-15      US           Martin Luther King Day     public
#> 3  2018-02-14      US                  Valentine's Day observance
#> 4  2018-02-19      US            Washington’s Birthday     public
#> 5  2018-04-17      US                          Tax Day observance
#> 6  2018-04-25      US Administrative Professionals Day observance
#> 7  2018-05-13      US                     Mother's Day observance
#> 8  2018-05-28      US                     Memorial Day     public
#> 9  2018-06-17      US                     Father's Day observance
#> 10 2018-07-04      US                 Independence Day     public
#> 11 2018-09-03      US                        Labor Day     public
#> 12 2018-10-08      US                     Columbus Day     public
#> 13 2018-10-31      US                        Halloween observance
#> 14 2018-11-11      US                     Veterans Day     public
#> 15 2018-11-22      US                 Thanksgiving Day     public
#> 16 2018-11-23      US       Day after Thanksgiving Day observance
#> 17 2018-12-24      US                    Christmas Eve   optional
#> 18 2018-12-25      US                    Christmas Day     public
#> 19 2018-12-31      US                   New Year's Eve observance
```

This is a basic example which shows you how to use the function holidaylist with a list of (more than one) countries:

``` r
holidaylist(c("US", "AD"), "2016", api_key = Sys.getenv("CALENDARINDEX_API_KEY"))
#>          date country                             name       type
#> 1  2016-01-01      AD                          Any nou     public
#> 2  2016-01-06      AD           Día de los Reyes Magos     public
#> 3  2016-02-09      AD                         Carnaval     public
#> 4  2016-03-14      AD            Dia de la Constitució     public
#> 5  2016-03-24      AD                     Jueves Santo       bank
#> 6  2016-03-25      AD                    Viernes Santo     public
#> 7  2016-03-27      AD                           Pascua     public
#> 8  2016-03-28      AD                  Lunes de Pascua     public
#> 9  2016-05-01      AD               Fiesta del trabajo     public
#> 10 2016-05-15      AD                      Pentecostés     public
#> 11 2016-05-16      AD             Lunes de Pentecostés     public
#> 12 2016-08-15      AD                         Asunción     public
#> 13 2016-09-08      AD         Mare de Déu de Meritxell     public
#> 14 2016-11-01      AD                 Todos los Santos     public
#> 15 2016-12-08      AD         La inmaculada concepción     public
#> 16 2016-12-24      AD                       Nochebuena       bank
#> 17 2016-12-25      AD                            Nadal     public
#> 18 2016-12-26      AD                      San Esteban     public
#> 19 2016-01-01      US                   New Year's Day     public
#> 20 2016-01-18      US           Martin Luther King Day     public
#> 21 2016-02-14      US                  Valentine's Day observance
#> 22 2016-02-15      US            Washington’s Birthday     public
#> 23 2016-04-18      US                          Tax Day observance
#> 24 2016-04-27      US Administrative Professionals Day observance
#> 25 2016-05-08      US                     Mother's Day observance
#> 26 2016-05-30      US                     Memorial Day     public
#> 27 2016-06-19      US                     Father's Day observance
#> 28 2016-07-04      US                 Independence Day     public
#> 29 2016-09-05      US                        Labor Day     public
#> 30 2016-10-10      US                     Columbus Day     public
#> 31 2016-10-31      US                        Halloween observance
#> 32 2016-11-08      US                     Election Day observance
#> 33 2016-11-11      US                     Veterans Day     public
#> 34 2016-11-24      US                 Thanksgiving Day     public
#> 35 2016-11-25      US       Day after Thanksgiving Day observance
#> 36 2016-12-24      US                    Christmas Eve   optional
#> 37 2016-12-25      US                    Christmas Day     public
#> 38 2016-12-26      US   Christmas Day (substitute day)     public
#> 39 2016-12-31      US                   New Year's Eve observance
```

This is a basic example which shows you how to use the function longholidays for one specific country:

``` r
longholidays(c("US"), "2018", api_key = Sys.getenv("CALENDARINDEX_API_KEY"))
#>    country  startdate  startday    enddate    endday length
#> 1       US 2018-01-13  Saturday 2018-01-15    Monday 3 days
#> 2       US 2018-02-17  Saturday 2018-02-19    Monday 3 days
#> 3       US 2018-05-26  Saturday 2018-05-28    Monday 3 days
#> 4       US 2018-09-01  Saturday 2018-09-03    Monday 3 days
#> 5       US 2018-10-06  Saturday 2018-10-08    Monday 3 days
#> 6       US 2018-01-06  Saturday 2018-01-07    Sunday 2 days
#> 7       US 2018-01-20  Saturday 2018-01-21    Sunday 2 days
#> 8       US 2018-01-27  Saturday 2018-01-28    Sunday 2 days
#> 9       US 2018-02-03  Saturday 2018-02-04    Sunday 2 days
#> 10      US 2018-02-10  Saturday 2018-02-11    Sunday 2 days
#> 11      US 2018-02-24  Saturday 2018-02-25    Sunday 2 days
#> 12      US 2018-03-03  Saturday 2018-03-04    Sunday 2 days
#> 13      US 2018-03-10  Saturday 2018-03-11    Sunday 2 days
#> 14      US 2018-03-17  Saturday 2018-03-18    Sunday 2 days
#> 15      US 2018-03-24  Saturday 2018-03-25    Sunday 2 days
#> 16      US 2018-03-31  Saturday 2018-04-01    Sunday 2 days
#> 17      US 2018-04-07  Saturday 2018-04-08    Sunday 2 days
#> 18      US 2018-04-14  Saturday 2018-04-15    Sunday 2 days
#> 19      US 2018-04-21  Saturday 2018-04-22    Sunday 2 days
#> 20      US 2018-04-28  Saturday 2018-04-29    Sunday 2 days
#> 21      US 2018-05-05  Saturday 2018-05-06    Sunday 2 days
#> 22      US 2018-05-12  Saturday 2018-05-13    Sunday 2 days
#> 23      US 2018-05-19  Saturday 2018-05-20    Sunday 2 days
#> 24      US 2018-06-02  Saturday 2018-06-03    Sunday 2 days
#> 25      US 2018-06-09  Saturday 2018-06-10    Sunday 2 days
#> 26      US 2018-06-16  Saturday 2018-06-17    Sunday 2 days
#> 27      US 2018-06-23  Saturday 2018-06-24    Sunday 2 days
#> 28      US 2018-06-30  Saturday 2018-07-01    Sunday 2 days
#> 29      US 2018-07-07  Saturday 2018-07-08    Sunday 2 days
#> 30      US 2018-07-14  Saturday 2018-07-15    Sunday 2 days
#> 31      US 2018-07-21  Saturday 2018-07-22    Sunday 2 days
#> 32      US 2018-07-28  Saturday 2018-07-29    Sunday 2 days
#> 33      US 2018-08-04  Saturday 2018-08-05    Sunday 2 days
#> 34      US 2018-08-11  Saturday 2018-08-12    Sunday 2 days
#> 35      US 2018-08-18  Saturday 2018-08-19    Sunday 2 days
#> 36      US 2018-08-25  Saturday 2018-08-26    Sunday 2 days
#> 37      US 2018-09-08  Saturday 2018-09-09    Sunday 2 days
#> 38      US 2018-09-15  Saturday 2018-09-16    Sunday 2 days
#> 39      US 2018-09-22  Saturday 2018-09-23    Sunday 2 days
#> 40      US 2018-09-29  Saturday 2018-09-30    Sunday 2 days
#> 41      US 2018-10-13  Saturday 2018-10-14    Sunday 2 days
#> 42      US 2018-10-20  Saturday 2018-10-21    Sunday 2 days
#> 43      US 2018-10-27  Saturday 2018-10-28    Sunday 2 days
#> 44      US 2018-11-03  Saturday 2018-11-04    Sunday 2 days
#> 45      US 2018-11-10  Saturday 2018-11-11    Sunday 2 days
#> 46      US 2018-11-17  Saturday 2018-11-18    Sunday 2 days
#> 47      US 2018-11-24  Saturday 2018-11-25    Sunday 2 days
#> 48      US 2018-12-01  Saturday 2018-12-02    Sunday 2 days
#> 49      US 2018-12-08  Saturday 2018-12-09    Sunday 2 days
#> 50      US 2018-12-15  Saturday 2018-12-16    Sunday 2 days
#> 51      US 2018-12-22  Saturday 2018-12-23    Sunday 2 days
#> 52      US 2018-12-29  Saturday 2018-12-30    Sunday 2 days
#> 53      US 2018-01-01    Monday 2018-01-01    Monday 1 days
#> 54      US 2018-07-04 Wednesday 2018-07-04 Wednesday 1 days
#> 55      US 2018-11-11    Sunday 2018-11-11    Sunday 1 days
#> 56      US 2018-11-22  Thursday 2018-11-22  Thursday 1 days
#> 57      US 2018-12-25   Tuesday 2018-12-25   Tuesday 1 days
```

This is a basic example which shows you how to use the function longholidays with a list of (more than one) countries:

``` r
longholidays(c("US", "AD"), "2016", api_key = Sys.getenv("CALENDARINDEX_API_KEY"))
#>     country  startdate  startday    enddate    endday length
#> 1        AD 2016-01-01    Friday 2016-01-03    Sunday 3 days
#> 2        AD 2016-03-12  Saturday 2016-03-14    Monday 3 days
#> 3        AD 2016-03-25    Friday 2016-03-27    Sunday 3 days
#> 4        AD 2016-08-13  Saturday 2016-08-15    Monday 3 days
#> 5        AD 2016-01-09  Saturday 2016-01-10    Sunday 2 days
#> 6        AD 2016-01-16  Saturday 2016-01-17    Sunday 2 days
#> 7        AD 2016-01-23  Saturday 2016-01-24    Sunday 2 days
#> 8        AD 2016-01-30  Saturday 2016-01-31    Sunday 2 days
#> 9        AD 2016-02-06  Saturday 2016-02-07    Sunday 2 days
#> 10       AD 2016-02-13  Saturday 2016-02-14    Sunday 2 days
#> 11       AD 2016-02-20  Saturday 2016-02-21    Sunday 2 days
#> 12       AD 2016-02-27  Saturday 2016-02-28    Sunday 2 days
#> 13       AD 2016-03-05  Saturday 2016-03-06    Sunday 2 days
#> 14       AD 2016-03-19  Saturday 2016-03-20    Sunday 2 days
#> 15       AD 2016-03-27    Sunday 2016-03-28    Monday 2 days
#> 16       AD 2016-04-02  Saturday 2016-04-03    Sunday 2 days
#> 17       AD 2016-04-09  Saturday 2016-04-10    Sunday 2 days
#> 18       AD 2016-04-16  Saturday 2016-04-17    Sunday 2 days
#> 19       AD 2016-04-23  Saturday 2016-04-24    Sunday 2 days
#> 20       AD 2016-04-30  Saturday 2016-05-01    Sunday 2 days
#> 21       AD 2016-05-07  Saturday 2016-05-08    Sunday 2 days
#> 22       AD 2016-05-14  Saturday 2016-05-15    Sunday 2 days
#> 23       AD 2016-05-15    Sunday 2016-05-16    Monday 2 days
#> 24       AD 2016-05-21  Saturday 2016-05-22    Sunday 2 days
#> 25       AD 2016-05-28  Saturday 2016-05-29    Sunday 2 days
#> 26       AD 2016-06-04  Saturday 2016-06-05    Sunday 2 days
#> 27       AD 2016-06-11  Saturday 2016-06-12    Sunday 2 days
#> 28       AD 2016-06-18  Saturday 2016-06-19    Sunday 2 days
#> 29       AD 2016-06-25  Saturday 2016-06-26    Sunday 2 days
#> 30       AD 2016-07-02  Saturday 2016-07-03    Sunday 2 days
#> 31       AD 2016-07-09  Saturday 2016-07-10    Sunday 2 days
#> 32       AD 2016-07-16  Saturday 2016-07-17    Sunday 2 days
#> 33       AD 2016-07-23  Saturday 2016-07-24    Sunday 2 days
#> 34       AD 2016-07-30  Saturday 2016-07-31    Sunday 2 days
#> 35       AD 2016-08-06  Saturday 2016-08-07    Sunday 2 days
#> 36       AD 2016-08-20  Saturday 2016-08-21    Sunday 2 days
#> 37       AD 2016-08-27  Saturday 2016-08-28    Sunday 2 days
#> 38       AD 2016-09-03  Saturday 2016-09-04    Sunday 2 days
#> 39       AD 2016-09-10  Saturday 2016-09-11    Sunday 2 days
#> 40       AD 2016-09-17  Saturday 2016-09-18    Sunday 2 days
#> 41       AD 2016-09-24  Saturday 2016-09-25    Sunday 2 days
#> 42       AD 2016-10-01  Saturday 2016-10-02    Sunday 2 days
#> 43       AD 2016-10-08  Saturday 2016-10-09    Sunday 2 days
#> 44       AD 2016-10-15  Saturday 2016-10-16    Sunday 2 days
#> 45       AD 2016-10-22  Saturday 2016-10-23    Sunday 2 days
#> 46       AD 2016-10-29  Saturday 2016-10-30    Sunday 2 days
#> 47       AD 2016-11-05  Saturday 2016-11-06    Sunday 2 days
#> 48       AD 2016-11-12  Saturday 2016-11-13    Sunday 2 days
#> 49       AD 2016-11-19  Saturday 2016-11-20    Sunday 2 days
#> 50       AD 2016-11-26  Saturday 2016-11-27    Sunday 2 days
#> 51       AD 2016-12-03  Saturday 2016-12-04    Sunday 2 days
#> 52       AD 2016-12-10  Saturday 2016-12-11    Sunday 2 days
#> 53       AD 2016-12-17  Saturday 2016-12-18    Sunday 2 days
#> 54       AD 2016-12-24  Saturday 2016-12-25    Sunday 2 days
#> 55       AD 2016-12-25    Sunday 2016-12-26    Monday 2 days
#> 56       AD 2016-01-06 Wednesday 2016-01-06 Wednesday 1 days
#> 57       AD 2016-02-09   Tuesday 2016-02-09   Tuesday 1 days
#> 58       AD 2016-05-01    Sunday 2016-05-01    Sunday 1 days
#> 59       AD 2016-09-08  Thursday 2016-09-08  Thursday 1 days
#> 60       AD 2016-11-01   Tuesday 2016-11-01   Tuesday 1 days
#> 61       AD 2016-12-08  Thursday 2016-12-08  Thursday 1 days
#> 62       US 2016-01-01    Friday 2016-01-03    Sunday 3 days
#> 63       US 2016-01-16  Saturday 2016-01-18    Monday 3 days
#> 64       US 2016-02-13  Saturday 2016-02-15    Monday 3 days
#> 65       US 2016-05-28  Saturday 2016-05-30    Monday 3 days
#> 66       US 2016-07-02  Saturday 2016-07-04    Monday 3 days
#> 67       US 2016-09-03  Saturday 2016-09-05    Monday 3 days
#> 68       US 2016-10-08  Saturday 2016-10-10    Monday 3 days
#> 69       US 2016-11-11    Friday 2016-11-13    Sunday 3 days
#> 70       US 2016-01-09  Saturday 2016-01-10    Sunday 2 days
#> 71       US 2016-01-23  Saturday 2016-01-24    Sunday 2 days
#> 72       US 2016-01-30  Saturday 2016-01-31    Sunday 2 days
#> 73       US 2016-02-06  Saturday 2016-02-07    Sunday 2 days
#> 74       US 2016-02-20  Saturday 2016-02-21    Sunday 2 days
#> 75       US 2016-02-27  Saturday 2016-02-28    Sunday 2 days
#> 76       US 2016-03-05  Saturday 2016-03-06    Sunday 2 days
#> 77       US 2016-03-12  Saturday 2016-03-13    Sunday 2 days
#> 78       US 2016-03-19  Saturday 2016-03-20    Sunday 2 days
#> 79       US 2016-03-26  Saturday 2016-03-27    Sunday 2 days
#> 80       US 2016-04-02  Saturday 2016-04-03    Sunday 2 days
#> 81       US 2016-04-09  Saturday 2016-04-10    Sunday 2 days
#> 82       US 2016-04-16  Saturday 2016-04-17    Sunday 2 days
#> 83       US 2016-04-23  Saturday 2016-04-24    Sunday 2 days
#> 84       US 2016-04-30  Saturday 2016-05-01    Sunday 2 days
#> 85       US 2016-05-07  Saturday 2016-05-08    Sunday 2 days
#> 86       US 2016-05-14  Saturday 2016-05-15    Sunday 2 days
#> 87       US 2016-05-21  Saturday 2016-05-22    Sunday 2 days
#> 88       US 2016-06-04  Saturday 2016-06-05    Sunday 2 days
#> 89       US 2016-06-11  Saturday 2016-06-12    Sunday 2 days
#> 90       US 2016-06-18  Saturday 2016-06-19    Sunday 2 days
#> 91       US 2016-06-25  Saturday 2016-06-26    Sunday 2 days
#> 92       US 2016-07-09  Saturday 2016-07-10    Sunday 2 days
#> 93       US 2016-07-16  Saturday 2016-07-17    Sunday 2 days
#> 94       US 2016-07-23  Saturday 2016-07-24    Sunday 2 days
#> 95       US 2016-07-30  Saturday 2016-07-31    Sunday 2 days
#> 96       US 2016-08-06  Saturday 2016-08-07    Sunday 2 days
#> 97       US 2016-08-13  Saturday 2016-08-14    Sunday 2 days
#> 98       US 2016-08-20  Saturday 2016-08-21    Sunday 2 days
#> 99       US 2016-08-27  Saturday 2016-08-28    Sunday 2 days
#> 100      US 2016-09-10  Saturday 2016-09-11    Sunday 2 days
#> 101      US 2016-09-17  Saturday 2016-09-18    Sunday 2 days
#> 102      US 2016-09-24  Saturday 2016-09-25    Sunday 2 days
#> 103      US 2016-10-01  Saturday 2016-10-02    Sunday 2 days
#> 104      US 2016-10-15  Saturday 2016-10-16    Sunday 2 days
#> 105      US 2016-10-22  Saturday 2016-10-23    Sunday 2 days
#> 106      US 2016-10-29  Saturday 2016-10-30    Sunday 2 days
#> 107      US 2016-11-05  Saturday 2016-11-06    Sunday 2 days
#> 108      US 2016-11-19  Saturday 2016-11-20    Sunday 2 days
#> 109      US 2016-11-26  Saturday 2016-11-27    Sunday 2 days
#> 110      US 2016-12-03  Saturday 2016-12-04    Sunday 2 days
#> 111      US 2016-12-10  Saturday 2016-12-11    Sunday 2 days
#> 112      US 2016-12-17  Saturday 2016-12-18    Sunday 2 days
#> 113      US 2016-12-24  Saturday 2016-12-25    Sunday 2 days
#> 114      US 2016-12-25    Sunday 2016-12-26    Monday 2 days
#> 115      US 2016-11-24  Thursday 2016-11-24  Thursday 1 days
```

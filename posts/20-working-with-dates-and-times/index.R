#| eval: false
## install.packages("lubridate")


#| message: false
library(tidyverse)
library(lubridate)



today()
now()



x <- today()
class(x)



ymd("1970-01-01")
ymd("2017-01-31")
mdy("January 31st, 2017")
dmy("31-Jan-2017")



ymd(20170131)



ymd("2016-09-13") ## International standard
ymd("2016/09/13") ## Just figure it out
mdy("09-13-2016") ## Mostly U.S.
dmy("13-09-2016") ## Europe



x <- c(
    "2016-04-05",
    "2016/05/06",
    "2016,10,4"
)
ymd(x)



library(nycflights13)

flights %>%
    select(year, month, day)



flights %>%
    select(year, month, day) %>%
    mutate(departure = make_date(year, month, day))



flights %>%
    select(year, month, day, hour, minute)



# try it yourself



today()
as_datetime(today())

now()
as_date(now())



ymd_hms("2017-01-31 20:11:59")
mdy_hm("01/31/2017 08:01")



ymd_hms("2016-09-13 14:00:00")
ymd_hms("2016-09-13 14:00:00", tz = "America/New_York")
ymd_hms("2016-09-13 14:00:00", tz = "")



x <- ymd_hm("1970-01-01 01:00")
class(x)
unclass(x)

typeof(x)

attributes(x)



y <- as.POSIXlt(x)
y
typeof(y)
attributes(y)



x <- ymd_hm("1970-01-01 01:00", tz = "")
x

attributes(x)



attr(x, "tzone") <- "US/Pacific"
x

attr(x, "tzone") <- "US/Eastern"
x



x <- ymd("2012-01-01", tz = "") ## Midnight
y <- dmy_hms("9 Jan 2011 11:34:21", tz = "")
x - y ## this works



x < y ## this works
x > y ## this works
x == y ## this works
x + y ## what??? why does this not work?



class(x)



x + 3 * 60 * 60 # add 3 hours



y <- date(y)
y



y + 1



x <- ymd("2012-03-01")
y <- ymd("2012-02-28")
x - y



x <- ymd("2013-03-01")
y <- ymd("2013-02-28")
x - y



x <- ymd_hms("2012-10-25 01:00:00", tz = "")
y <- ymd_hms("2012-10-25 05:00:00", tz = "GMT")
y - x



.leap.seconds



x <- ymd_hms(c(
    "2012-10-25 01:13:46",
    "2015-04-23 15:11:23"
), tz = "")
year(x)
month(x)
day(x)
weekdays(x)



x <- ymd_hms(c(
    "2012-10-25 01:13:46",
    "2015-04-23 15:11:23"
), tz = "")
minute(x)
second(x)
hour(x)
week(x)


#| warning: false
#| message: false
library(here)
library(readr)
storm <- read_csv(here("data", "storms_2004.csv.gz"), progress = FALSE)
storm



names(storm)


#| message: false
library(dplyr)

# try it yourself


#| echo: false
storm_sub <-
    storm %>%
    select(BEGIN_DATE_TIME, EVENT_TYPE, DEATHS_DIRECT) %>%
    mutate(begin = dmy_hms(BEGIN_DATE_TIME)) %>%
    rename(type = EVENT_TYPE, deaths = DEATHS_DIRECT) %>%
    select(begin, type, deaths)



storm_sub



library(ggplot2)
storm_sub %>%
    ggplot(aes(x = begin)) +
    geom_histogram(bins = 20) +
    theme_bw()


#| fig-width: 12
#| fig-height: 12
library(ggplot2)
storm_sub %>%
    ggplot(aes(x = begin)) +
    facet_wrap(~type) +
    geom_histogram(bins = 20) +
    theme_bw() +
    theme(axis.text.x.bottom = element_text(angle = 90))



storm_sub %>%
    ggplot(aes(x = begin, y = deaths)) +
    geom_point()



storm_sub %>%
    filter(month(begin) == 6) %>%
    ggplot(aes(begin, deaths)) +
    geom_point()



storm_sub %>%
    filter(month(begin) == 6, day(begin) == 16) %>%
    ggplot(aes(begin, deaths)) +
    geom_point()



## ymd(c("2010-10-10", "bananas"))



unclass(today())



d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 20



options(width = 120)
sessioninfo::session_info()


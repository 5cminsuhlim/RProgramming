## DATES ##

x <- as.Date("1970-01-01")
x
unclass(x) ## returns 0

unclass(as.Date("1970-01-02")) ## returns 1 b/c dates stored from 1970-01-01



## TIMES ##
## represented using POSIXct or POSIXlt
## POSIXct holds as large integers -- useful for df
## POSIXlt holds other useful info (e.g. day of week, day of year, month) as a list
## weekdays
## months
## quarters

x <- Sys.time()
x
unclass(x) ## returns number of seconds since 1970-01-01

p <- as.POSIXlt(x)
names(unclass(p))
p$sec

dateString <- c('January 10, 2012 10:40', 'December 9, 2011 9:10')
x <- strptime(dateString, '%B %d, %Y %H:%M') ## converts character-string format to time obj
x
class(x)


## OPERATIONS
x <- as.Date('2012-01-01') ## date obj
y <- strptime('9 Jan 2011 11:34:21', '%d %b %Y %H:%M:%S') ## POSIX obj
x
y
x - y ## can't conduct operations on incompatible types

## operations keep track of leap years, leap seconds, daylight savings, and time zones
x <- as.Date('2012-03-01'); y <- as.Date('2012-02-28')
x - y

x <- as.POSIXct('2012-10-25 01:00:00')
y <- as.POSIXct('2012-10-25 06:00:00', tz = "GMT")
y - x

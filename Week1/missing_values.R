## MISSING VALUES ##

#NA for everything else
#NaN for undefined mathematical operations
#is.na()
#is.nan()
#NA values have a class
#NaN is NA; NA is NOT NaN

x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)

x <- c(1, 2, NaN, NaN, 4)
is.na(x)
is.nan(x)
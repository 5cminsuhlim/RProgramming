## SUBSETTING ##

#[] returns an object of same class as original; can extract multiple
#[[]] extracts elements of a list or df; can only extract singles
#$ extracts elements of a list or df; similar to [[]]


## BASICS ##
x <- c("a", "b", "c", "d", "c", "a")
x[1] ## returns a
x[2] ## returns b
x[1:4] ## returns a, b, c, d

x[x > "a"] ## returns b, c, d, c

u <- x > "a" ## create logical vector
u ## returns F T T T T F
x[u] ## equivalent to x[x > "a]



## LISTS ##
x <- list(foo = 1:4, bar = 0.6, baz = "hello")

x[1] ## returns a list that contains sequence 1~4
x[[1]] ## returns only sequence 1~4
name <- "foo"
x[[name]] ## returns only sequence 1~4
x$name ## returns NULL b/c element "name" DNE
x$foo ## returns properly

x$bar ## returns 0.6
x[["bar"]] ##same thing as x$bar
x["bar"] ## returns a list with 0.6

x[c(1, 3)] ## extracts element 1 (foo) and element 3 (baz)


x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))

x[[c(1, 3)]] ## finds first element (a), then third element (14)
x[[1]][[3]] ## same thing as x[[c(1, 3)]]

x[[c(2, 1)]] ## finds second element (b), then first element (3.14)



## MATRICES ##
x <- matrix(1:6, 2, 3)

x[1, 2] ## returns element in first row, second col
x[2, 1] ## returns element in second row, first col

x[1,] ## returns elements in first row
x[, 2] ## returns elements in second column

x[1, 2, drop = FALSE] ## returns a 1x1 matrix with element in first row, second col

x[1, , drop = FALSE] ## returns a 1x3 matrix with elements in first row



## PARTIAL MATCHING ##
x <- list(aardvark = 1:5)
x$a ## returns 1~5

x[["a"]] ## returns NULL
x[["a", exact = FALSE]] ## returns 1~5



## REMOVING NA VALUES ##
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad] ## returns vector of values not NA

y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y) ## returns a logical vector showing BOTH vectors NOT missing
x[good]
y[good]

airquality[1:6, ] ## first 6 rows of df
good <- complete.cases(airquality) ## returns a logical vector of ONLY COMPLETE rows
airquality[good, ][1:6, ] ## filters by complete rows, returns first 6



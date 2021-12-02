## LOOP FUNCTIONS ##

## lapply ##
## loop over a list of objs and evaluate a function on each element
## RETURN: list

x <- list(a = 1:5, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

x <- 1:4
lapply(x, runif, min = 0, max = 10) ## passing in runif arguments

## anonymous function
## similar to lambda functions (i.e. defining a function within lapply)
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[, 1]) ## extracts first column from each matrix in x



## sapply ##
## simplified version of lapply
## RETURN: if list length = 1, vector
## RETURN: else if list where every element in the vector is of the same length (> 1), matrix
## RETURN: else, list

x <- list(a = 1:5, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
sapply(x, mean) ## returns a vector



## apply ##
## apply a function over the margins of an array (generally matrices)
## not really faster than using loops, but can be done inline
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) ## 2 = column; takes the mean of each column
apply(x, 1, sum) ## 1 = row; takes the sum of each row

## useful shortcut functions:
## rowSums == apply(x, 1, sum)
## rowMeans == apply(x, 1, mean)
## colSums == apply(x, 2, sum)
## colMeans == apply(x, 2, mean)

x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75)) ## passing in quantile arguments

a <- array(rnorm(400), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)



## mapply ##
## multivariate version of lapply
## apply a function in parallel over a set of arguments (e.g. multiple lists)
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep, 1:4, 4:1) ## same as above

## vectorizing functions
noise <- function(n, mean, sd){
        rnorm(n, mean, sd)
}
noise(5, 1, 2)
noise(1:5, 1:5, 2) ## doesn't produce desired output
list(noise(1, 1, 2), noise(2, 2, 2), noise(3, 3, 2), noise(4, 4, 2), noise(5, 5, 2))
mapply(noise, 1:5, 1:5, 2) ## same as above



## tapply ##
## apply a function over subsets of a vector
x <- c(rnorm(10), runif(10), rnorm(10, 1)) ## vector of nums
f <- gl(3, 10) ## creates 3 levels; 10 1s, 10 2s, 10 3s
tapply(x, f, mean) ## splits x across the 3 levels, takes the means of each level

tapply(x, f, mean, simplify = FALSE) ## without simplify, returns a list

tapply(x, f, range)



## split ##
## useful when used w/ lapply or sapply
## RETURN: list
x <- c(rnorm(10), runif(10), rnorm(10, 1)) 
f <- gl(3, 10) 
split(x, f) ## returns a list of 3 elements, each element corresponding to 10 rnorm, 10 runif, 10 rnorm

lapply(split(x, f), mean) ## same thing as tapply(x, f, mean)

## splitting data frames
s <- split(airquality, airquality$Month) ## split airquality DF via Month
lapply(s, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')], na.rm = TRUE)) ## returns a list

sapply(s, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')], na.rm = TRUE)) ## returns a matrix

## splitting on more than one level
x <- rnorm(10)
f1 <- gl(2, 5) ## creates 2 levels; 5 1s, 5 2s
f2 <- gl(5, 2) ## creates 5 levels; 2 1s, 2 2s, 2 3s, 2 4s, 2 5s
interaction(f1, f2) ## concatenates the levels of f1 and f2; results in 10 levels

split(x, list(f1, f2)) ## keeps empty levels
split(x, list(f1, f2), drop = TRUE) ## drops empty levels
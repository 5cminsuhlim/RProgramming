## STR FUNCTION ## 
## diagnostic function
## compact displaying for an R object's internals
## alternative to summary()

str(str)

str(ls)

str(lm)

x <- rnorm(100, 2, 4)
summary(x)
str(x)

f <- gl(40, 10) ## 40 levels, 10 times for each level
str(f)
summary(f)

str(airquality)

m <- matrix(rnorm(100), 10, 10)
str(m)

s <- split(airquality, airquality$Month)
str(s)
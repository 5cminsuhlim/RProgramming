## DATATYPES ##

## VECTORS ##

## c() function
x <- c(0.5, 0.6) ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F) ## logical
x <- c("a", "b", "c") ## character
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ## complex


## vector() function
x <- vector("numeric", length = 10)


## mixing objects (IMPLICIT COERCION)
y <- c(1.7, "a") ## character ("1.7", "a")
y <- c(TRUE, 2) ## numeric (1, 2)
y <- c("a", TRUE) ## character ("a", "TRUE")


## EXPLICIT COERCION
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)


## NONSENSICAL COERCION
x <- c("a", "b", "c")
as.logical(x) ## results in NA
as.complex(x)



## LISTS ##
x <- list(1, "a", TRUE, 1 + 4i)



## MATRICES ##
m <- matrix(nrow = 2, ncol = 3)

dim(m)

attributes(m)

m <- matrix(1:6, nrow = 2, ncol = 3) ## matrices are created column-wise


## CREATE MATRICES VIA DIMENSION ATTRIBUTE ON VECTOR
m <- 1:10 ## vector 1~10
dim(m) <- c(2, 5) ## sets dimensions of m to nrow=2, ncol=5


## CBIND (column-binding) / RBIND (row-binding)
x <- 1:3
y <- 10:12
cbind(x, y)

rbind(x, y)



## FACTORS ##

#special type of vector for categorical data
#unordered
#ordered
#treated specially by modeling functions like lm() and glm()
#self-describing


x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
table(x)
unclass(x)



## DATAFRAMES ##

#used to store tabular data
#can store different classes of objects
#special attributed called row.names
#read.table() OR read.csv() OR data.frame()
#can be converted to matrix via data.matrix()

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
nrow(x)
ncol(x)

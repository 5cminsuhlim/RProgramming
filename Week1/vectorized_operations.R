## VECTORIZED OPERATIONS ##
x <- 1:4; y <- 6:9
x + y ## adds the respective tuples together

x > 2 ## compare every number in x
x >= 2
y == 8

x * y
x / y



## VECTORIZED MATRIX OPERATIONS ##
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)

#element-wise operations
x * y
x / y

#true matrix operations
x %*% y
x %/% y
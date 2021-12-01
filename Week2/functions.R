## FUNCTIONS ##

add2 <- function(x, y){
  x + y ## function returns the last expression
}

above10 <- function(x){
  use <- x > 10
  x[use]
}

above <- function(x, n = 10){ ## sets default value n=10
  use <- x > n
  x[use]
}

colmean <- function(x, removeNA = TRUE){
  nc <- ncol(x)
  means <- numeric(nc)
  
  for(i in 1:nc){
    means[i] <- mean(x[, i], na.rm = removeNA)
  }
  
  means
}



## "..." ARGUMENT ##
myplot <- function(x, y, type = 'l', ...){ ## used to extend another function; passes the rest of parameters
  plot(x, y, type = type, ...) 
}

mean
args(paste)
args(cat)

## any params that come after "..." MUST be named and CANNOT be partially matched
paste('a', 'b', sep = ':')
paste('a', 'b', se = ':')

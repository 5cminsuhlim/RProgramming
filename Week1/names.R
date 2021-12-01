## NAMES ##

#all R objects can have names

x <- 1:3
names(x) <- c("foo", "bar", "norf")
names(x)

x <- list(a = 1, b = 2, c = 3)
x

m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a", "b"), c("c", "d")) ## first provide row names, then col names
m

## SCOPING RULES ##

lm <- function(x){
        x * x
}

search() ## .GlobalEnv is always first; package:base is always last

f <- function(x, y){
        x^2 + y / z 
        ## z is a "free variable", i.e. value for z will be searched for in the 
        ## environment in which the function was defined
        ## TL;DR "GLOBAL" variable keyword in C++ / Java
}

## R allows for defining functions within functions
make.power <- function(n){
        pow <- function(x){
                x^n
        }
        
        pow
}

cube <- make.power(3)
square <- make.power(2)

cube(3)
square(2)

ls(environment(cube))
get('n', environment(cube))

ls(environment(square))
get('n', environment(square))

## returns 34
y <- 10
f <- function(x){
        y <- 2
        y^2 + g(x)
}

g <- function(x){
        x * y
}

## optimization (optim, nlm, optimize)
## constructor function
make.negLogLik <- function(data, fixed = c(FALSE, FALSE)){
        params <- fixed
        function(p){
                params[!fixed] <- p
                mu <- params[1]
                sigma <- params[2]
                a <- -0.5 * length(data) * log(2 * pi * sigma^2)
                b <- -0.5 * sum((data - mu)^2) / (sigma^2)
                -(a + b)
        }
}

## estimating params
set.seed(1); normals <- rnorm(100, 1, 2)
nLL <- make.negLogLik(normals)
nLL
ls(environment(nLL))

optim(c(mu = 0, sigma = 1), nLL)$par

nLL <- make.negLogLik(normals, c(FALSE, 2)) ## fix sigma = 2
optimize(nLL, c(-1, 3))$minimum

nLL <- make.negLogLik(normals, c(1, FALSE)) ## fix mu = 1
optimize(nLL, c(1e-6, 10))$minimum

nLL <- make.negLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = 'l')

nLL <- make.negLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = 'l')

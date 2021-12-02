## SIMULATION ##

## d = probability density function (pdf) aka density
## r = random number generation
## p = cumulative distribution function (cdf) aka probability
## q = quantile (inverse cdf) function

## rnorm ##
## generates random Normal variables w/ a given mean and S.D.

## dnorm ## 
## evaluates the Normal probability density (w/ a given mean and S.D.) at a point (or a vector of points)

## pnorm ## 
## evalutes the cumulative distribution function for a Normal distribution

## rpois ## 
## generates random Poisson variables w/ a given rate



## RANDOM MODELS ## 
dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log = FALSE)
rnorm(n, mean = 0, sd = 1)

x <- rnorm(10)
y <- rnorm(10, 20, 2)
summary(x)
summary(y)

set.seed(1) ## important for generating the same pseudo-random numbers
rnorm(5)

rpois(10, 1)
rpois(10, 2)
rpois(10, 20)

ppois(2, 2)
ppos(4, 2)
ppois(6, 2)



## LINEAR MODELS ## 
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x * e
summary(y)
plot(x, y)

set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x * e
summary(y)
plot(x, y)

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)



## RANDOM SAMPLING ## 
set.seed(1)
sample(1:10, 4) ## sample 4 numbers from 1~10
sample(letters, 5) ## sample 5 letters
sample(1:10)
sample(1:10, replace = TRUE) ## allows for repeats
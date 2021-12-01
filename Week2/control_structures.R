## CONTROL STRUCTURES ##

## IF, ELSE
## the two are equivalent
if(x > 3){
  y <- 10
} else{
  y <- 0
}

y <- if(x > 3){
  10
} else{
  0
}



## FOR
for(i in 1:10){
  print(i)
}

## all are equivalent
x <- c('a', 'b', 'c', 'd')

for(i in 1:4){
  print(x[i])
}

for(i in seq_along(x)){ ## seq_along takes vector
  print(x[i])
}

for(letter in x){
  print(letter) ## python-esque
}

for(i in 1:4) print(x[i]) ## inline

#nested
x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))){ ## seq_len takes integer
  for(j in seq_len(ncol(x))){
    print(x[i, j])
  }
}



## WHILE
count <- 0
while(count < 10){
  print(count)
  count <- count + 1
}

z <- 5
while(z >= 3 & z <= 10){
  print(z)
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1){
    z <- z + 1
  } else{
    z <- z - 1
  }
}



## REPEAT (initiates infinite loops), BREAK
x0 <- 1
tol <- 1e-8

repeat{
  x1 <- computeEstimate()
  
  if(abs(x1 - x0) < tol){
    break
  } else{
    x0 <- x1
  }
}



## NEXT
for(i in 1:100){
  if(i <= 20){
    next ## skips the first 20 iterations
  }
  
  ## do something
}



## RETURN
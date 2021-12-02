## makeCacheMatrix creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        ## initialize cache value to NULL
        m <- NULL
        
        ## create matrix
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        
        ## get value of matrix
        get <- function() x
        
        ## store inverted matrix in cache
        setInverse <- function(inverse) m <<- inverse
        
        ## get inverted matrix from cache
        getInverse <- function() m
        
        ## return
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}



## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## get inverse matrix from cache
        m <- x$getInverse()
        
        ## if cache wasn't empty, return cached matrix
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        
        ## else, make a new matrix
        data <- x$get()
        
        ## invert matrix
        m <- inverse(data, ...)
        
        ## cache inverted matrix
        x$setInverse(m)
        
        ## return
        m
}
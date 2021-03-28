## Assignment: Caching the Inverse of a Matrix

## Matrix inversion is usually a costly computation and there may be some benefit 
## to caching the inverse of a matrix rather than compute it repeatedly 

## Solution:
  
## A) makeCacheMatrix: A function that creates a special “matrix” object that can cache its inverse.
## B) cacheSolve: A function that computes the inverse of the special “matrix” returned by makeCacheMatrix.


## A) 
makeCacheMatrix <- function(x = matrix()) {
  ## this part "allocate" a matrix with zero values with unspecif size M(m,n)
  ## this matrix will have nonzeros values later (turn to our inverse matrix M')
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    ## building a matrix 
    get <- function() x   ## get the input matrix X(m,n) with nonzeros values
    setInverse <- function(solve) m <<- solve ## invert matrix X(m,n) into 1/(X) = M'
    getInverse <- function() m  ## get the values for M' 
    
    ## output to be called: $get & $getInverse
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## B) 
## This function computes the inverse of the special "matrix" created by a funtion above
## If the inverse has already been calculated (and the matrix has not changed), 
## then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()  ## get the values created at function makeCacheMatrix(x$getInverse)
  if (!is.null(inv)) {   ## condition: if is nonzero matrix pass to getting cached data
    message("getting cached data")
    return(inv)          ## return inverse matrix
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv   # final output
}



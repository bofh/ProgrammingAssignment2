## Matrix object and cached version for inverse function
## 
## Example usage:
##  x <- makeCacheMatrix()
##  m <- matrix(c(2, 4, 3, 1), nrow=2, ncol=2)
##  x$set(m)
##  x$get()
##  cacheSolve(x) # first run can be slow

## Constructor for the matrix with cached inverse
makeCacheMatrix <- function(x = matrix()) {
  ci <- NULL

  set <- function(y) {
    x <<- y
    ci <<- NULL
  }

  get <- function() { 
    x
  }

  setinverse <- function(inverse) {
    ci <<- inverse
  }

  getinverse <<- function() {
    ci
  }

  list(set = set, get = get,
       setinverse = setinverse, getinverse = getinverse)
}

## returns the inverse of the matrix, result is cached after the first run
cacheSolve <- function(x, ...) {
  ci <- x$getinverse()

  if (!is.null(ci)) {
    message("returning inverse matrix from cache")
    return(ci)
  }

  m <- x$get()
  ci <- solve(m, ...)
  x$setinverse(ci)

  ci
}

## Matrix object with cached version of inverse function
## 
## Example usage:
##  x <- makeCacheMatrix()
##  m <- matrix(c(2, 4, 3, 1, 5, 7), nrow=3, ncol=2)
##  x$set(m)
##  x$get()

## Constructor for the matrix with cached inverse function

makeCacheMatrix <- function(x = matrix()) {

  set <- function(y) {
    x <<- y
  }

  get <- function() {
    x
  }

  list(set = set, get = get)
}


## returns the inverse of the matrix, result is cached after the first run

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

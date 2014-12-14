## pre-build matric's inv
## 

## utily cache matrix, cache the inv of a matric in clojure.

makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL
  set <- function(y) {
    x <<- y
    invm <<- NULL
  }
  get <- function() x
  setinv <- function(inv) invm <<- inv
  getinv <- function() invm
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}



## get inv of matric

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invm <- x$getinv()
        if (!is.null(invm)) {
          message("getting cached data")
          return(invm)
        }
        data <- x$get()
        invm <- solve(data,...)
        x$setinv(invm)
        invm
}

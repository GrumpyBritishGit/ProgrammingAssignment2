# Set of functions that are designed for the caching of time consuming inverse matrix calculations.

# The function takes a matrix and creates an object within which to store a set of variables and functions to
# facilitate the caching of the inverse of the matrix in addition to the original state, thereby removing the need 
# for recalculation.

# additional error handling has been added.

makeCacheMatrix <- function(x = matrix()) {
  if(!is.matrix(x)) stop("Please pass the function a matrix")
  i <- NULL
  set <- function(x,...) {
    x <<- matrix(x,...)
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

# This function utilises the objects defined by the previous function and will either:
# 1. Calculate and store the value of the inverted matrix
# 2. Return stored inversion values in the event that there have been previously calculated.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  m
}

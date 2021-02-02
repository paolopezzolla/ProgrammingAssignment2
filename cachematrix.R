## Put comments here that give an overall description of what your
## functions do
#Matrix inversion might be a time-consuming computation and 
#there might be many benefits by caching the inverse than 
#compute it repeatedly
## Write a short comment describing this function
#The following function is able to create a special "vector"
#that can make a matrix objecte able to cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
#This function computes the inverse of the special "matrix"
#created by the function above

cacheSolve <- function(x, ...) {
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}

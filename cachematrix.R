## The below mentioned functions calculate the inverse of a matrix and saves it
## to the cache such that when the user attempts to calculate the
## matrix inverse next time, the previously saved value is returned instead of
## repeating the calculation.

## The first function, creates a special "matrix" object, which is really a list 
## containing a function to

## a. set the value of the vector
## b. get the value of the vector
## c. set the value of the mean
## d. get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
  c <- NULL
  set <- function(y) {
    x <<- y
    c <<- NULL
}
get <- function() x
setinverse <- function(inverse) c <<- inverse
  getinverse <- function() c
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)
}

## The following function calculates the inverse of the "matrix" created
## with the above function, however, it first checks to see if the inverse
## has already been calculated. If it has already been calculated it 'get's the inverse 
## from the cache and skips the computation whereas if this is not the case
## it calculates the matrix inverse
## and sets the value of the inverse in the cache via the 'setinverse' function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  c <- x$getinverse()
  if(!is.null(c)) {
  message("getting cached data")
  return(c)
  }
    data <- x$get()
    c <- solve(data, ...)
    x$setinverse(c)
    c
}

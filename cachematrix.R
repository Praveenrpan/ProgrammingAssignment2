## Put comments here that give an overall description of what your
## functions do

## This function is intened to create a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL                ##Placeholder for value of matrix inverse
  set <- function (y) {      ##assign new value of matrix in original environment
      x <<- y                ## vlaue of matric in original environment
      m <<- NULL           ## reset inv to null if there is a new matrix
    
  }
  get <- function ()x        ## get function to return the vlaue of matrix argument
  setinverse <- function (inverse) m <<- inverse ## assigns value of inverse in the original environment
  getinverse <- function () m                    ## gets the value of inverse when called
  list (set=set, get=get, setinverse=setinverse, getinverse=getinverse) ## For referring to the functions

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse ()
  if (!is.null(m)) {
    message ("getting cached data")
    return (m)
  }
        
  data <- x$get ()
  m <- solve (data,...)
  x$setinverse(m)
  m
}

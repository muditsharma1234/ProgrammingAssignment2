## The function creates a matrix and computes its inversion if it is not present in the cache
## If the inversion is present in the cache a cached copy of the inversion is returned
## functions do

## Creation of special vector which has list containing function to 
## 1. Set Value of the matrix
## 2. get the value of the vector
## 3, Set the value of the mean
## 4. get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set <- function(x)
  {
    x <<- y
    m <<- NULL
  }
  get<- function() x
  setinverse <- function(inverse) m<<-inverse
  getinverse <- function() m
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Diag calculates an identity matrix of size which is passed on to the create matrix function 
## the function returns the inverted matrix incase a new matrix has been created else returns a
## cached value of inversion

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m))
        {
          message("Getting cached data")
          return(m)
        }
      data<-x$get()
      var1<-sqrt(length(data))
      m<-solve(data,diag(var1))
      x$setinverse(m)
      m
          
}

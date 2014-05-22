## Put comments here that give an overall description of what your
## functions do

## The functions makeCacheMatrix and cacheSolve are meant to cache (store) and calculate the inverse of a matrix.


## Write a short comment describing this function
## This function caches the calculated inverse matrix, so it can be reused without reprocessing.
## It has four "subfunctions": 
              #1) Set the matrix to be used, 
              #2) Get the matrix to be used, 
              #3) Set the matrix inverse and 
              #4) Get the matrix inverse.

makeCacheMatrix <- function(x = matrix()) {
matrixInverse<-NULL
setMatrix<-function(SetMatrixArgument)
  x<-matrixSetArgument
  matrixInverse<<-NULL
getMatrix <- function() x
setMatrixInverse <- function(SetMatrixInverseArgument) matrixInverse <<- SetMatrixInverseArgument
getMatrixInverse <- function() matrixInverse
list(setMatrix = setMatrix, getMatrix = getMatrix,
     setMatrixInverse = setMatrixInverse,
     getMatrixInverse = getMatrixInverse)
}


## Write a short comment describing this function
## The function cacheSolve calculates de inverse matrix when it is not cached. 
## When the inverse is already cached it uses the cached inverse matrix instead.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  matrixInverse <- x$getMatrixInverse()
  if(!is.null(matrixInverse)) {
    message("getting cached data")
    return(matrixInverse)
  }
  matrixInverse <- solve(x$getMatrix())
  x$setMatrixInverse(matrixInverse)
  matrixInverse
}

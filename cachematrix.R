## The functions makeCacheMatrix and cacheSolve are meant to cache (store) and calculate the inverse of a matrix.

makeCacheMatrix <- function(x = matrix()) {
## This function caches the calculated inverse matrix, so it can be reused without reprocessing.
  ## It has four "subfunctions": 
  #1) Set the matrix to be used, 
  #2) Get the matrix to be used, 
  #3) Set the matrix inverse, 
  #4) Get the matrix inverse.

#Create the Matrix Inverse object
matrixInverse<-NULL

#1) Set the matrix to be used
setMatrix<-function(SetMatrixArgument)
  x<-matrixSetArgument
  matrixInverse<<-NULL

#2) Get the matrix to be used, 
getMatrix <- function() x

#3) Set the matrix inverse
setMatrixInverse <- function(SetMatrixInverseArgument) matrixInverse <<- SetMatrixInverseArgument

#4) Get the matrix inverse.
getMatrixInverse <- function() matrixInverse

#Return the subfunctions
list(setMatrix = setMatrix, getMatrix = getMatrix,
     setMatrixInverse = setMatrixInverse,
     getMatrixInverse = getMatrixInverse)
}

cacheSolve <- function(x, ...) {
#This function calculate the inverse matrix when it is not already cached.
  
  ##get the inverse of matrix by the "subfunction" getMatrixInverse() of function makeCacheMatrix
  matrixInverse <- x$getMatrixInverse()

  ## When the inverse is already cached get the cached inverse matrix instead.
  if(!is.null(matrixInverse)) {
    message("getting cached inverse matrix")
    return(matrixInverse)
  }
  
  ## Calculate de inverse matrix when it is not cached. 
  matrixInverse <- solve(x$getMatrix())
  
  ##Cache the inverse matrix using the "subfunction" SetMatrixInverse() of function makeCacheMatrix
  x$setMatrixInverse(matrixInverse)
  
  ## Return a matrix that is the inverse of 'x'
  matrixInverse
}

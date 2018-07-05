## A pair of functions that cache the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  ## Set the matrix
  set_mat <- function( matrix ) {
    mat <<- matrix
    inv <<- NULL
  }
  
  ## Get the matrix
  get_mat <- function() {
    mat
  }
  
  ## Set the inverse of the matrix
  set_inv_mat <- function(inverse) {
    inv <<- inverse
  }
  
  ## Get the inverse of the matrix
  get_inv_mat <- function() {
    inv
  }
  
  ## List of the methods used above
  list(set_mat = set_mat, get_mat = get_mat,
       set_inv_mat = set_inv_mat,
       get_inv_mat = get_inv_mat)
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## then cacheSolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {

  mat <- x$get_inv_mat()
  
  ## Return the inverse if already set
  if( !is.null(mat) ) {
    return(mat)
  }
  
  ## Get the matrix
  data_mat <- x$get_mat()
  
  ## Calculate the inverse
  mat <- solve(data_mat) %*% data_mat
  
  ## Set the inverse
  x$set_inv_mat(m)
  
  ## Return a matrix that is the inverse of 'x'
  mat
}

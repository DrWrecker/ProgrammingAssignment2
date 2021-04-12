## A pair of functions which calculates and caches the inverse of a matrix
## as needed

makeCacheMatrix <- function(x = matrix()) {
  #creates an empty matrix (logical)
  inverse_matrix <- NULL # setting inverse_matrix in function to NULL
  set <- function(y) {
    x <<- y  
    # setting x (the matrix) in global frame to y
    inverse_matrix <<- NULL 
    # setting inverse_matrix in global environment to NA
  }
  
  get <- function() x 
  #returns x, a matrix
  
  set_inverse <- function(inverse) {
    inverse_matrix <<- inverse 
    #sets inverse_matrix in global environment to value of inverse
  }
  
  get_inverse <- function() {
    inverse_matrix
    #gets value of inverse_matrix in the function environment
  }
  
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
  #returns a list of functions
}

## Check to see if inverse matrix has been calc'd, if so, send message
## Else calc inverse, cache inverse and return inverse

cacheSolve <- function(x, ...) {
  verse <- x$get_inverse()
  if(!is.null(verse)) {
    message("getting cached data")
    return(verse)
  }
  data <- x$get()
  verse <- solve(data, ...)
  x$set_inverse(verse)
  verse
}

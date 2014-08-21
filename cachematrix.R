## The functions below intially create the Cache matrix if it does not exist
## and if it does, it checks to see if the inverse can be pulled from memory


## This function first checks if the matrix exists in memory and then
## if it is equal to the matrix being supplied. If it is it supplies the 
## inverse from memory

makeCacheMatrix <- function(x = matrix()) {
  
  ## First check if the variable exists in memory. If not, intialize it with the
  ## inout matrix and calculate the Inverse
  if (!exists("CacheMatrix") || is.na(CacheMatrix))
  {
    CacheMatrix <<- x
	InverseMatrix <<- NA
    InverseMatrix <<- cacheSolve(x)
  }  
  ## If the variable exists and is not NA, then check for equality
  ## If not, then send it down to solve
  else if (identical(CacheMatrix, x) == FALSE)
  {
    InverseMatrix <<- NA
    retMatrix <- cacheSolve(x)
  }
  InverseMatrix  
}


## This function provides the inverse of the matrix provided. 
## It checks if the inout provided is already in the cache and 
## if not re-calculates it

cacheSolve <- function(x, ...) {
		if (is.na(InverseMatrix) || (identical(CacheMatrix, x) == FALSE))
		{
			InverseMatrix <<- solve(x)
			CacheMatrix <<- x
		}
		## Return a matrix that is the inverse of 'x'
		InverseMatrix
        
}

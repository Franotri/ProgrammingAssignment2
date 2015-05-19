##What it does : returns the inverse of a square invertible matrix. How to use : call makeCacheMatrix with your matrix as an argument, and load it in a variable. 
##Then call cacheSolve with this variable as an argument. The first time you run cacheSolve, solve function is performed. Next times, result is returned from memory. 
## This is mostlu useful for loops, as described in assignment description. 
## matrix to be inverted can be redefined without calling the full makeCacheMatrix (use <variable name>$set(new matrix name>) for this)

## Thie function gets the matrix to be inverted, and defines subfunction (and subsequently another environment to store memory) 

makeCacheMatrix <- function(x = matrix()) {
		i <- NULL
		set <- function(y){
			x <<- y
			i <<- NULL
		}
		get <- function() x
		setsolve <- function (solve) i <<- solve
		getsolve <- function () i
		list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}		
		


##This function gives the result either through solve() resolution, or by getting the memory. The argument 'x' is the variable in which makeCacheMatrix is loaded.

cacheSolve <- function(x, ...) {
        i <- x$getsolve()
		if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
		data <- x$get()
		i <- solve(data,...)
		x$setsolve(i)
		i
}

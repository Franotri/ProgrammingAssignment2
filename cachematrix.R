##What it does : returns the inverse of a square invertible matrix. 
##How to use : First call makeCacheMatrix with your matrix as an argument, and load it in a variable (<variable name>).  
##Call cacheSolve with this variable as an argument. The first time you run cacheSolve, solve function is performed. 
##Afterward, while calling cachesolve, result is returned from 'cache memory' (mostly useful for loops)
##Matrix to be inverted can be redefined with set function without calling the full makeCacheMatrix
##Use <variable name>$set(new matrix name>) for this)

## This function gets the matrix to be inverted, and defines subfunction (and subsequently another environment to store memory) 

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
		


##This function gives the result either through solve() resolution, or by getting the memory. 
##The argument 'x' is the variable (<variable name>) in which makeCacheMatrix function is loaded with the matrix of interest.

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

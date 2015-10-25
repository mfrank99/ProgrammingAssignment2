## Put comments here that give an overall description of what your
## functions do

# The following functions allow the user to pass a cache a potentially intensive calculation 
# to memory.  When requesting the calculation result, the procedure checks to see if the 
# result exists in memory and returns it.  If the result has not yet been calculated, it is
# returned and stored for future use.

## Write a short comment describing this function

# This function takes a matrix as an argument and stores a list object containing the
# original matrix as well as several anonymous functions to interact with the data.
# __$get()      returns the original matrix passed to makeCacheMatrix
# __$getInv()   returns the cached inverse of the matrix (or NULL if it has not been set)

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    #initializes the cache of the inverted matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    #returns the original matrix
    get <- function() x
    
    #used by the cacheSolve function to set the inverted matrix cache
    setInv <- function(solve) inv <<- solve
    
    #returns the cached inverted matrix
    getInv <- function() inv
    
    #returns the functions as a list
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)

}


## Write a short comment describing this function

# This function returns the inverse of a matrix created with the makeCacheMatrix function.
# If the inverse has been calculated previously, it will return the result along with a message
# signifying that the result is being retrieved from memory and not being calculated.
# If the result is not currently in memory, it will be calculated, stored for future use, and
# returned.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getInv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInv(m)
    m
}

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
   
   		## initialize
        inv <- NULL
        ##set inverse
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        ##get inverse
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        
        ## return list of functione
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        inv <- x$getinverse()
        ## check if already exists
        if(!is.null(inv)) {
                message("getting cached inverse matrix")
                return(inv)
        }
        ## if not calculate inverse
        inv <- solve(x$get())
        x$setinverse(inv)
        inv
}
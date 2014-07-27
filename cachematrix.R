## A pair of functions that cache the inverse of a matrix


## Creates a special matrix object that can cache its inverse

makeCacheMatrix <- function( m = matrix()) 
{

i <- NULL

set <- function( matrix ) 
	{
       m <<- matrix
       i <<- NULL
    	}

get <- function() 
	{
    	 m
   	}

setInverse <- function(inverse) 
	{
        i <<- inverse
    	}

getInverse <- function() 
	{
       i
    	}

list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}
## Compute the inverse of the matrix returned by makeCacheMatrix function. If the inverse has already been calculated and not changed, this function would retrieve the inverse from the cache.

cacheSolve <- function(x, ...) 
{

## Matrix that is the inverse of 'x'
m <- x$getInverse()

## Returns the inverse if its already set
if( !is.null(m) ) 
	{
       message("getting cached data")
       return(m)
   	 }

## Obtain the matrix
data <- x$get()

## Compute the inverse
m <- solve(data) 

## Set the inverse to the object
x$setInverse(m)

## Return the inverse of the matrix
m
}
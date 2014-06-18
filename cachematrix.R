## This script contains two functions that, together, cache the inverse of a matrix.
## We assume that the matrix supplied is always invertible.

## The makeCacheMatrix function creates a special matrix object and returns the value of the inverse.
makeCacheMatrix <- function(x = matrix()) {	#we specify that the function must be run on a matrix object.
	m<-NULL			 		#sets m to NULL within the makeCacheMatrix function. 
	set<-function (y) {			#sets the value of the matrix we want to use.
		x<<-y				#forces x to exist globally, outside of the "set" function here.
		m<<-NULL			#sets m equal to NULL, if m is not otherwise defined in the parent env.
	}
	
	get <- function () x 			#get the value of the matrix created by the "set" function above.

	set.inverse<-function(solve) m<<-solve 	#returns the inverse of the matrix created by the "set" function.
	get.inverse<-function()m		#retrieves the inverse of the matrix created by the "set" function

	list(set=set, get=get, 
		set.inverse=set.inverse
		get.inverse=get.inverse)
}


## The cacheSolve function calculates the inverse of the matrix created above, and places it in memory.
## Then, if R is told to calculate the inverse of this matrix again, it skips the calculation step and
## just returns the cached inverse it has stored.
cacheSolve <- function(x, ...) {		#the ... argument means that the number of arguments passed to the cacheSolve function can vary.
        m<-x$get.inverse()			#retrieves the inverse of the matrix and assigns it to m.
	if (!is.null(m)){			#R checks to see if m exists. If m is NOT NULL, m already exists, and R retrieves m, which is the cached inverse.
		message ("getting cached data")
		return (m)			#R prints the cached inverse (m) to the console.
	}
	data<-x$get()				#If m WAS NULL in the previous if statement, the original matrix is retrieved by the get function...
	m<-solve(data, ...)			#...and R finds its inverse using the solve function and sets it to m 
	x$set.inverse(m)
	m					#prints m to the console.

}

##By way of example, call the makeCacheMatrix function and assign the value it returns (which is matrix) to the variable v.

v<-makeCacheMatrix()

##Now, use the set function for "v" to make a matrix. This can be any invertible matrix. Here we will use a matrix
##containing the numbers 1 to 4, arranged in two rows and two columns (so that the matrix is square). 

v$set(matrix(c(1,2,3,4), nrow=2, ncol=2))

#Call the get function for v (v$get) to pull out the 2x2 matrix just made using the v$set function.
v$get()

#Now make the matrix just produced available to the cacheSolve function. R should print out
#the inverse of this matrix in the console. This inverse was calculated by the cacheSolve function,
#because m had previously been null.
cacheSolve(v)

#If we make the same matrix available to cacheSolve again, R will give us the inverse of the matrix v again. But, before
#the inverse is returned, we'll see the message "getting cached data" because m is not null. Rather, the inverse has been
#stored in memory and R is returning the stored inverse instead of calculating it again.
 



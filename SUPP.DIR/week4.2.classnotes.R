

myfunc <- function(somenum) {
  retval <- sqrt(somenum)
  return(retval)
}

myfunc <- function(somenum) {
  if (somenum < 0 ) {
    retval <- sqrt(as.complex(somenum))
  } else {
    retval <- sqrt(somenum)
  }
  return(retval)
}


myfunc2 <- function(somenum,complex="n") {
  if (somenum < 0 & complex == "n") {
     stop("HEY !! - Cannot take square root of negative number")
  } else if (somenum < 0 & complex == "y") {
     retval <- sqrt(as.complex(somenum))
  } else {
     retval <- sqrt(somenum)
  }
  return(retval)
}

`[`

mtcars[mtcars$mpg >= 30,]

mtcars[mtcars$mpg >= 30,]$wt
[1] 2.200 1.615 1.835 1.513

mean(mtcars[mtcars$mpg >= 30,]$w

mylm <- lm(mpg~wt,data=mtcars)

is.odd <- function(someval) {
  if (someval %% 2 != 0) {
     retval <- TRUE
  } else {
     retval <- FALSE
  }
  return(retval)
}

#

pythag <- function(a,b) {
  c <- sqrt(a^2 + b^2)
  myreturnlist <- list(hypoteneuse = c, a=a, b=b)
  return(myreturnlist)
}


exampodd <- c(3,6,9,1,10)
median(exampodd)

svec <- sort(exampodd)
(length(svec))/2

idx <- ceiling(length(svec)/2)
med <- svec[idx]

# here we have an even number of elements
# how do we handle this ?

exampeven <- c(11,9,4,7)
median(exampeven)

(svec <- sort(exampeven))

idx <- (length(svec))/2
mean(c(svec[idx],svec[idx+1]))
med <- mean(c(7,9))


environment()

myenvfunc <- function() {
  print(environment())
}

x <-0


a <- 10 

x <- 5

f <- function(x) {
  a <- 5
  g(x)
}

g <- function(y) {
  return(y + a)
}

f(2)


a <- 10

x <- 5

f <- function(x) {
  a <- 5
  g <- function(y) {
    return(y + a)
  }
  g(x)
}

f(2)




# DEBUGGING





mymedian <- function(xvec=rnorm(1000), na.rm=TRUE) {
  
  # Function to compute the median of a numeric vector
  # INPUT(S): xvec - A numeric vector
  #           na.rm - TRUE or FALSE to indicate removal of missing values
  #
  # OUTPUT: A single value representing the median value of xvec
  
  # First check for non numeric input. Then check for missing values
  
  if (!is.numeric(xvec)) {
    stop("The input is not numeric. Please check the vector")
  } else if (na.rm & sum(is.na(xvec)) >= 1) {
    xvec <- xvec[!is.na(xvec)]
  }                                  
  
  # Okay we are finished checking arguments. We need to get the length
  # of the input vector and, while we are at it, let's get a sorted version
  # of the vector.
  
  veclength  <- length(xvec)   # Get vector length
  sortedvec  <- sort(xvec)     # Get sorted vector
  
  # Check vector length for being odd or even. We first handle
  # the case where the length is odd
  
  if (veclength %% 2 != 0) {   
    
    index  <- ceiling(veclength/2)
    retval <- sortedvec[index]
    
    # The following logic is executed if the length is even
    
  } else {   
    
    index1  <- veclength/2
    indices <- c(index1,index1+1)
    retval  <- mean(sortedvec[indices])
    
  }   # End if statement
  
  return(retval)
  
}      # End function definition




mymedian <- function(xvec=rnorm(1000), na.rm=TRUE) {
  
  # Function to compute the median of a numeric vector
  # INPUT(S): xvec - A numeric vector
  #           na.rm - TRUE or FALSE to indicate removal of missing values
  #
  # OUTPUT: A single value representing the median value of xvec
  
  # First check for non numeric input. Then check for missing values
  
  if (!is.numeric(xvec)) {
    stop("The input is not numeric. Please check the vector")
  } else if (na.rm & sum(is.na(xvec)) >= 1) {
    xvec <- xvec[!is.na(xvec)]
  }                                  
  
  # Okay we are finished checking arguments. We need to get the length
  # of the input vector and, while we are at it, let's get a sorted version
  # of the vector.
  
  veclength  <- length(xvec)   # Get vector length
  sortedvec  <- sort(xvec)     # Get sorted vector
  
  # Check vector length for being odd or even. We first handle
  # the case where the length is odd
  
  if (veclength %% 2 != 0) {   
    
    index  <- ceiling(veclength/2)
    retval <- sortedvec[index]
    
    # The following logic is executed if the length is even
    
  } else {   
    
    index1  <- veclength/20         # Unintentional mistake
    indices <- c(index1,index1+1)
    retval  <- mean(sortedvec[indices])
    
  }   # End if statement
  
  return(retval)
  
}      # End function definition


mymedian <- function(xvec=rnorm(1000), na.rm=TRUE, debug=TRUE) {
  
  # Function to compute the median of a numeric vector
  # INPUT(S): xvec - A numeric vector
  #           na.rm - TRUE or FALSE to indicate removal of missing values
  #
  # OUTPUT: A single value representing the median value of xvec
  
  # First check for non numeric input. Then check for missing values
  
  if (!is.numeric(xvec)) {
    stop("The input is not numeric. Please check the vector")
  } else if (na.rm & sum(is.na(xvec)) >= 1) {
    xvec <- xvec[!is.na(xvec)]
  }                                  
  
  # Okay we are finished checking arguments. We need to get the length
  # of the input vector and, while we are at it, let's get a sorted version
  # of the vector.
  
  veclength  <- length(xvec)   # Get vector length
  sortedvec  <- sort(xvec)     # Get sorted vector
  
  if (debug) {
    cat("veclength:",veclength,"\n","sortedvec:",sortedvec,"\n")
  }

  # Check vector length for being odd or even. We first handle
  # the case where the length is odd
  
  if (veclength %% 2 != 0) {   
    
    index  <- ceiling(veclength/2)
    retval <- sortedvec[index]
    
  if (debug) {
    cat("index: ",index,"\n")
  }
    # The following logic is executed if the length is even
    
  } else {   
    
    index1  <- veclength/20         # Unintentional mistake
    indices <- c(index1,index1+1)
    retval  <- mean(sortedvec[indices])
    
    if (debug) {
      cat("indices: ",indices,"\n")
    }
  }   # End if statement
  
  return(retval)
  
}      # End function definition



x <- 0
myfunc <- function(x) {
   x <<-3
}
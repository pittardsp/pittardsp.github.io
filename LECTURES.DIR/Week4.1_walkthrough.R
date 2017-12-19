
my.func <- function(somenum) {
  my.return.val <- sqrt(somenum)
  return(my.return.val)
}

# We could do it all with one line but that isn't good for readability:

my.func <- function(somenum) {return(sqrt(somenum))}

##

pythag <- function(a,b) {
  c <- sqrt(a^2 + b^2)
  return(c)
}

pythag(4,5)

x <- 4
y <- 5

pythag(x,y)


###

pythag <- function(a,b) {
  c <- sqrt(a^2 + b^2)
  myreturnlist <- list(hypoteneuse = c, sidea = a, sideb = b) 
  return(myreturnlist)
}

pythag(3,4)  

pythag(3,4)$hypoteneuse

###


pythag <- function(a,b) {
  c = sqrt(a^2 + b^2)
  myreturnlist <- list(hypoteneuse = c, sidea = a, sideb = b) 
  return(myreturnlist)
}

pythag(3,4)


##

pythag <- function(a = 4, b = 5) {
  if (!is.numeric(a) | !is.numeric(b)) {
    stop("I need real values to make this work")
  }
  c <- sqrt(a^2 + b^2)
  myreturnlist <- list(hypoteneuse = c, sidea = a, sideb = b) 
  return(myreturnlist)
}

# pythag(3,"5")  # These will bomb - try it out

# pythag("3",5)


###

pythag <- function(a = 4, b = 5) {
  if (!is.numeric(a) | !is.numeric(b)) {
    stop("I need real values to make this work")
  }
  if (a <=0 | b <= 0) {
    stop("Arguments need to be positive")
  }
  c <- sqrt(a^2 + b^2)
  myreturnlist <- list(hypoteneuse = c, sidea = a, sideb = b) 
  
  return(myreturnlist)
  
} # End Function

# pythag(-3,3)   # This will bomb

pythag(3,3)

##

is.odd <- function(someval) {
  retvec <- vector()
  for (ii in 1:length(someval)) {
    if (someval[ii] %% 2 != 0) {
      retvec[ii] = TRUE
    } else {
      retvec[ii] = FALSE
    }
  }
  return(retvec)
  
}  # End function

is.odd(3)

numbers <- c(9,9,4,4,6,10,7,18,2,10)

is.odd(numbers)

numbers[is.odd(numbers)]   # Very useful

###

y <- vector()
x <- seq(-3,3)      
for (ii in 1:length(x)) {
  y[ii] <- (x[ii])^2 
}

length(x)

###


myplotter <- function(xvals, mfunc, plotcolor="blue") {
  
  # Function to print y = x^2
  # Input: xvalues
  # Output: A plot and the xvals and yvals used to make that plot
  
  yvals = vector()
  for (ii in 1:length(xvals)) {
    yvals[ii] <- mfunc(xvals[ii])
  }
  
  plot(xvals, yvals, main="Super Cool Data Plot",type="l",col=plotcolor)
  retlist <- list(x=xvals, y=yvals)
  return(retlist)
}

xvals <- seq(-3,3,0.5)

myplotter(xvals, cos, plotcolor="red")


###

mymin <- function(somevector) {
  
  # Function to find the minimum value in a vector
  # Input: A numeric vector
  # Output: A single value that represents the minimum
  
  mymin <- somevector[1] # Set the minimum to an arbitrary value
  
  # Now loop through the entire vector. If we find a value less than 
  # mymin then we set mymin to be that value.
  
  for (ii in 1:length(somevector)) {
    if (somevector[ii] < mymin) {
      mymin <- somevector[ii]
    }
  }
  return(mymin)
}

set.seed(123)

testvec <- rnorm(10000)

mymin(testvec)


###

myextreme <- function(somevector, action="min") {
  
  if (action == "min") {
    myval <- somevector[1] # Set the minimum to an arbitrary value
    
    for (ii in 1:length(somevector)) {
      if (somevector[ii] < myval) {
        myval <- somevector[ii]
      }
    }    # End for
    
  } else {   # If action is not "min" then we assume the "max" is wanted
    
    myval <- somevector[1] # Set the minimum to an arbitrary value
    
    for (ii in 1:length(somevector)) {
      if (somevector[ii] > myval) {
        myval <- somevector[ii]
      }
    }            # End for
  }               # End If  
  return(myval)
}

myextreme(testvec,"min")

###

myfunc <- function(somedf, somefac) {
  
  # Function to split a data frame by a given factor
  # Input: A data frame, a factor
  # Output: A list containing a count of records in each group
  
  retlist <- list()    # Empty list to return group record count 
  mysplits <- split(somedf,somefac)  # Split the data frame by somefac
  
  for (ii in 1:length(mysplits)) {  # loop through the splits
    retlist[[ii]] <- nrow(mysplits[[ii]]) 
  }
  names(retlist) <- names(mysplits)
  return(retlist)
}

myfunc(mtcars,mtcars$cyl)

###

mtcenter <- function(somemat) {
  
  # Input: A matrix to center
  # Output: A matrix that is centered
  
  retmat = rep(0, length(somemat)) # Recipe to initialize a 
  dim(retmat) = dim(somemat)       # matrix the same size as
  # another filled with 0
  
  for (col in 1:ncol(somemat)) {
    for (row in 1:nrow(somemat)) {
      retmat[row, col] <- somemat[row, col] - mean(somemat[,col])
    }
  }
  
  return(retmat)
}

set.seed(123)

mymat <- matrix(round(rnorm(6),2),3,2)

mtcenter(mymat)

my.mat <- as.matrix(mtcars[,c(1,3:6)])


apply(my.mat,2, mean)

my.mat <- as.matrix(mtcars[,c(1,3:6)])

apply(my.mat,2, function(x) {c(mean=mean(x),sd=sd(x),range=range(x))})

apply(my.mat,2, function(x) {
  c(mean=mean(x),
    sd=sd(x),
    range=range(x))
})




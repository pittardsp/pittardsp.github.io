myfunc <- function(x) {
  
  # There are multiple ways to do this. Here is a way using a for loop
  # 
  
  y <- vector()
  col <- vector()
  
  for (ii in 1:length(x)) {
    if (x[ii] <= 0) {
         y[ii] <- sin(x[ii])
         col[ii] <- "blue"
    } else if ( x[ii] > 0 & x[ii] <= 1 ) {
         y[ii] <- x[ii]^2
         col[ii] <- "green"
    } else {
         y[ii] <- x[ii]^3
         col[ii] <- "red"
    }
  }

  # Note that type = "b" will put up both points and lines simultaneously
  # and will also color the points at the same time. 
  
    plot(x,y,col=col,pch=19,type="b",
         main="Piecemeal Function Plot",xlab="X-Values",ylab="Y-Values")
    
    abline(v=c(0,1),lty=2)
  
  return(y)
}
myfunc <- function(x,plot=FALSE,color="blue") {
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
  if (plot) {
 #   plot(x,y,col=col,pch=19,type="b",main="Piecemeal Function Plot",xlab="X-Values",ylab="Y-Values")
  plot(x,y,col=color,pch=19,type="b",main="Piecemeal Function Plot",xlab="X-Values",ylab="Y-Values")
    grid()
 #   abline(v=c(0,1),lty=2)
  }
  return(y)
}
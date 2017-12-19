par(mfrow=c(1,3))

cyls <- split(mtcars, mtcars$cyl)
for (ii in 1:length(cyls)) {
     tmpdf <- cyls[[ii]]
     sname <- names(cyls)[ii]
     plot(tmpdf$wt, tmpdf$mpg, 
          main = paste("MPG vs Wt",sname,"Cyl"),
          ylim = c(0,40), xlab = "Wt / 1,000",
          ylab = "MPG", pch=19, col="blue")
     grid()
}

sapply(cyls, function(x) {plot(x$wt,x$mpg,ylim=c(0,40),col="blue",pch=19,xlab="Wt/1,000",ylab="MPG");grid()})

par(mfrow=c(1,3))
myplot <- function(x) {
  plot(x$wt,x$mpg, ylim=c(0,40), col="blue", pch=19,
       xlab = "Wt/1,000", ylab="MPG",
       main = paste("MPG vs Wt",names(x)," Cyl"))
  grid()
  
}

myplot <- function(x) {
  plot(x$wt,x$mpg, ylim=c(0,40), col="blue", pch=19,
       xlab = "Wt/1,000", ylab="MPG",
       main = paste("MPG vs Wt",names(x)," Cyl"))
  grid()
  
}

sapply(cyls,myplot)

library(lattice)
xyplot(mpg~wt | factor(cyl) + factor(am,labels=c("A","M")), data=mtcars, main="MPG vs Wt", xlab="Wt/1,000", ylab="MPG",pch=19,type=c("p","g"))


# segments(x0, y0, x1 = x0, y1 = y0,
col = par("fg"), lty = par("lty"), lwd = par("lwd"),
...)

myboxplot <- function(somevec, boxcol="gray90") {
  
  par(mfrow=c(1,1)) # One row by One Column print region
  
  my5 = fivenum(somevec) # Get fivenum summary
  
  # Draw a blank plot into which we will draw the box plot
  # Note we add on 5 extra units to the end of the fivenum
  # summary value to have extra room to put up the last line
  
  plot(somevec,type="n",ylim=c(0,8),xlim=c(0,my5[5]+5),xlab="")
  
  # This loops through the fivenum summary and draws vertical
  # lines for each value
  
  for (ii in 1:length(my5)) {
     segments(my5[ii],2,my5[ii],6)
  }
  
  for (ii in 1:length(my5)) {
    text(my5[ii],7,round(my5[ii],2),cex=0.6)
  }
  # We draw a shaded gray rectangle over the IQR
  
  rect(my5[2],2,my5[4],6,col=boxcol)
  
  segments(my5[3],2,my5[3],6) # Draw median over IQR rectangle
 
  # Draw the top and bottom on the IQR box
  
  segments(my5[2],2,my5[4],2)
  segments(my5[2],6,my5[4],6)
  
  # Draw lines connecting IQR to Whiskers
  
  segments(my5[1],4,my5[2],4)
  segments(my5[4],4,my5[5],4)
  
}
                                                                                                 
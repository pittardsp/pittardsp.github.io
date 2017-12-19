## Ixavier Higgins



###
#1# 
###

plot.2panel <- function(data, xvar, yvar){
  
  plot1q <- quantile(xvar)
  plot2q <- quantile(yvar)
  par(mfrow=c(1,2))
  
  vest = cut(yvar, breaks=c(plot2q[1],plot2q[2],plot2q[3],plot2q[4],max(yvar)+1), labels = c("black","red","green","blue"),include.lowest=T)
  plot(xvar, yvar, xlab="Weight /1,000", ylab="MPG", main="MPG vs Weight", col=as.character(vest), pch=16)
    
      # Drawing horizontal lines for left plot
    for(ii in 1:length(plot2q)){
      abline(h=plot2q[[ii]],lty=ii, col="gray90")
    }
     # Applying labels for quantiles
    for (ii in 1:length(plot2q)){
      text(4.5, plot2q[[ii]], names(plot2q)[[ii]])
    }
    
    legend(3.5,33, c("0-25", "25-50", "50-75", "75-100"), col=c("black","red","green","blue"), bg="gainsboro", pch=19, title="Quantiles")
  
  best = cut(xvar, breaks=c(plot1q[1],plot1q[2],plot1q[3],plot1q[4],max(xvar)+1), labels = c("black","red","green","blue"),include.lowest=T)
  plot(xvar, yvar, xlab="Weight /1,000", ylab="MPG", main="MPG vs Weight", col=as.character(best),pch=16)
  axis(3, lty=0, cex.axis=1, at=plot1q,labels=c(round(plot1q,1)),lwd.ticks=0, line=-1)   
      # Drawing horizontal lines for right plot
    for(ii in 1:length(plot1q)){
      abline(v=plot1q[[ii]],lty=ii, col="gray90")
    }
    legend("topright", c("0-25", "25-50", "50-75", "75-100"), col=c("black","red","green","blue"), bg="gainsboro", pch=19, title="Quantiles")
    #mtext(as.expression(plot1q), round(plot1q,1),3)
}

plot.2panel(mtcars, mtcars$wt, mtcars$mpg)






####
#2a#
####

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)


mycol=colorRampPalette(c("aliceblue","steelblue"))(7)
hold = boxplot(Wt~Observer, data=sparrows)
boxplot(Wt~Observer, data=sparrows, notch=T, xlab="Observer Number", ylab="Sparrow Weight", main="Sparrow Weight by Observer", varwidth=T, col=mycol)
abline(v=c(1:7), lty=3, col="gray90")   
abline(h=seq(16,26,2), lty=3, col="gray90")
axis(3, lty=0, cex.axis=1.2, at=seq(1:7),labels=hold$n  ,lwd.ticks=0, line=-1, col.axis= "red")   
  




####
#2b#
####
library(lattice)

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")
head(myd)

xyplot(price~carat | factor(color), data = myd, groups=cut, pch = 20, main="Diamond Price vs Carat Size",auto.key=list(corner=c(.67,.95), title="Diamond Quality", pch=16),grid=T)





###
#3#
###

plot.ci <- function(data, smean){
  plot(sci, type="n", main="Confidence Intervals", xlab="",ylab="",xlim=c(min(sci)-.1,max(sci)+.1), ylim=c(.1,20.2), yaxt="n" )
  index=.2
  D=vector()
  for(ii in 1:nrow(sci)){
    if( smean < sci[[ii,1]] | smean > sci[[ii,2]] ){
      segments(sci[[ii,1]], index*ii, sci[[ii,2]], index*ii, col="red")
    }else {
      segments(sci[[ii,1]],index*ii, sci[[ii,2]],index*ii, col="blue")
      
    }
  }
  abline(v=smean)
  for(ii in 1:nrow(sci)){
    if(smean < sci[[ii,1]] | smean> sci[[ii,2]]){
      D[[ii]]=ii
    }
  }
  D=D[!is.na(D)]
  return(D) 

}

plot.ci(sci,smean)













































myf <- function(model,incr=0.1) {
  retvec <- vector()
  jj <- 1
  idx <- seq(.1,.9,incr)
  for (ii in idx) {
    predictedvals <- ifelse(model$fitted.values >= ii,1,0)
    tmp <- table(predictedvals,model$y)
    total_miss <- sum(tmp[2,1],tmp[1,2])
    retvec[jj] <- total_miss
    jj <- jj + 1
  }
  names(retvec) <- idx
  return(retvec)
}

#newjobs[97:108,3] <- rnorm(12,70,50)

newjobs$color <- ifelse(newjobs$jobs >=0,"purple","blue")
par(bg="#E5E3D2")
mp <- barplot(newjobs$jobs,width=rep(0.20,24),
        ylim=c(-500,500),col=newjobs$color,space=0.9,axes=FALSE,
        plot=TRUE)
rect(4.5,-500,9.5,500,density=100,col="#FFFFFF")
mp <- barplot(newjobs$jobs,width=rep(0.20,24),
              ylim=c(-500,500),col=newjobs$color,space=0.9,
              axes=FALSE,
              add=TRUE)

axis(2,at=seq(-500,500,100),labels=seq(-500,500,100),las=2)
labs <- rep("",length(mp))
labs[seq(1,108,12)] <- as.character(unique(newjobs$year))

labs <- unique(newjobs$year)
labs <- substr(labs,3,4)
#axis(1,at=mp,labels=labs,cex.axis=0.8)
#axis(1,at=mp[seq(1,120,12)],labels=c(labs,""),cex.axis=0.8)

c(mp[seq(1,108,12)],mp[length(mp)]) -> atvals
axis(1,at=atvals,labels=c(labs,"09"),cex.axis=0.8)

abline(h=seq(-500,500,100),lty=3,col="black")
text(4,400,"Recession",cex=0.8,pos=4)

text(34,-50,"November: Lost 36,000 Jobs",cex=0.8)

mtext("Two in a Row",side=3,line=3,adj=0)
txt <- "For the second straight month, the US economy lost more jobs"
mtext(txt,side=3,line=2,adj=0,cex=0.8)
mtext("than it gained. Monthly change in nonfarm payolls",
      side=3,line=1,adj=0,cex=0.8)



mympg <- function(df=mpg,yval='hwy',lines=TRUE) {
  library(RColorBrewer)
  
  tmp <- df
  ylims <- range(tmp[,yval])
  cols <- rev(brewer.pal(4,"PuOr"))
  plot(tmp$displ,tmp$hwy,type="n",ylim=ylims)
  quants <- cut(tmp[,yval],breaks=quantile(tmp[,yval]),
                labels=c("Q1","Q2","Q3","Q4"),include.lowest=T)
  tmp <- cbind(tmp,quants=quants)
  mys <- split(tmp,quants)
  for (ii in 1:length(mys)) {
    points(mys[[ii]]$displ,mys[[ii]][,yval],pch=19,col=cols[ii])
  }
  abline(h=quantile(df[,yval]),lty=3) 
}


##


mympg <- function(yr=1999,yval='hwy',lines=TRUE) {
  library(RColorBrewer)
  library(ggplot2)
  data(mpg)
  
  if (yr != 1999 & yr != 2008) {
    stop("Invalid year - must be 1999 or 2008")
  }
  
  mpg <- subset(mpg,year==yr)
  ylims <- range(mpg[,yval])
  cols <- rev(brewer.pal(4,"PuOr"))
  
  title <- paste("MPG",yval,"for year",yr)
  ylab  <- paste(yval,"MPG",sep=" ")
  plot(mpg$displ,mpg$hwy,type="n",ylim=ylims,
       xlab="Displacement",ylab=ylab,main=title)
  quants <- cut(mpg[,yval],breaks=quantile(mpg[,yval]),
                labels=c("Q1","Q2","Q3","Q4"),include.lowest=T)
  tmp <- cbind(mpg,quants=quants)
  mys <- split(tmp,quants)
  for (ii in 1:length(mys)) {
    points(mys[[ii]]$displ,mys[[ii]][,yval],pch=19,col=cols[ii])
  }
  
  if (lines) {
    abline(h=quantile(mpg[,yval]),lty=3)
  }
}


### See plot in snapndrag http://bigpicture.typepad.com/comments/2008/03/saturday-mornin.html

par(bg="#E5E3D2")
barplot(newjobs$jobs,width=rep(0.20,24),xlim=c(0,24),
        ylim=c(-500,500),col=newjobs$color,space=0.9,axes=FALSE)
abline(h=seq(-400,400,100),lty=3,col="gray")
axis(2,at=seq(-500,500,100),labels=seq(-500,500,100),las=2)

axis(1,at=seq(0,23),tick=T,labels=newjobs$month,cex.axis=0.8)
#axis(1,at=seq(0,12),tick=T,labels=newjobs$year,cex.axis=0.8)
# minor.tick(nx=10)
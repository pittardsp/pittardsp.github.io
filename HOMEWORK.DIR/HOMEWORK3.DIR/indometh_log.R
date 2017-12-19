plot.indometh <- function(mydf=Indometh,log=FALSE,colors=rainbow(6)) {
  
  my.length <- length(levels(mydf$Subject)) 
  if (log) {
    mydf$conc <- log(mydf$conc)
    ylab <- "Log Concentrations of Indometacin (mcg/ml)"
  } else {
    ylab <- "Concentrations of Indometacin (mcg/ml)"
  }
  
  plot(mydf$conc ~ mydf$time,
       main="Pharmacokinetics of Indomethicin",
       type="n",
       xlab="Time at which blood was drawn",
       ylab = ylab)
  
  col <- colors       # Get some colors
  temp <- split(mydf,mydf$Subject)
  for (ii in 1:length(temp)) {
    points(temp[[ii]]$conc ~ temp[[ii]]$time,col=col[ii],type="l",lwd=2)
  }
  legend("topright",paste("Subject",names(temp),sep="_"),col=col,pch=15,cex=0.9)
  grid()
}


# Deer data


url <- "http://steviep42.bitbucket.org/bios545r_2016/DATA.DIR/Deer.txt"
deer <- read.csv(url,sep=",",header=T)
colorRampPalette(c("green", "blue"))( length(unique(deer$Farm)) ) -> colors
boxplot(LCT~Farm,data=deer,cex.axis=0.7,las=2,
        main="Deer Length by Farm Name",col=colors,
        xlab="Farm Name",ylab="Measured Length of Deer") -> mp
mtext(mp$n,side=3,at=1:24,cex=0.7,col="red")




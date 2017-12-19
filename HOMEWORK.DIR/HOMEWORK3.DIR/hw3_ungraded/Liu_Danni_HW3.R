### Danni Liu 
### BIOS 560R - Homework 3

##Problem 1
plot.q1=function(){
  par(mfrow=c(1,2))
  
  # first plot the graphic on the left
  plot(mtcars$wt,mtcars$mpg,xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight",
       pch=20,col=cut(mtcars$mpg,breaks=quantile(mtcars$mpg),include.lowest=T,
                      labels=c("black","red","green","blue")))
  abline(h=quantile(mtcars$mpg),lty=1:5,col="gray60")
  text(4.5,quantile(mtcars$mpg),label=names(quantile(mtcars$mpg)),cex=0.7,col="black")
  legend("topright",inset=c(0.15,0.07),legend=c("0-25","25-50","50-75","75-100"),
         title="Quantiles",pch=16,col=c("black","red","green","blue"),cex=0.7,bg="grey90")
  
  # then plot the graphic on the right
  plot(mtcars$wt,mtcars$mpg,xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight",
       pch=20,col=cut(mtcars$wt,breaks=quantile(mtcars$wt),include.lowest=T,
                      labels=c("black","red","green","blue")))
  abline(v=quantile(mtcars$wt),lty=1:5,col="gray60")
  mtext(round(quantile(mtcars$wt),1.1),side=3,at=quantile(mtcars$wt),cex=0.7,col="black",)
  legend("topright",inset=c(0,0),legend=c("0-25","25-50","50-75","75-100"),
         title="Quantiles",pch=16,col=c("black","red","green","blue"),cex=0.7,bg="grey90")
}
plot.q1()

##Problem 2a
par(mfrow=c(1,1))
url="http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows=read.table(url,header=T)
m.cols = colorRampPalette(c("white","steelblue"))
boxes=boxplot(Wt~Observer,data=sparrows,varwidth=TRUE,notch=TRUE,col=m.cols(7),
              xlab="Observer Number",ylab="Sparrow Weight",
              main="Sparrow Weight by Observer")
mtext(boxes$n,side=3,at=1:7,col="red")
grid()


##Problem 2b
par(mfrow=c(1,1))
library(lattice)
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")
xyplot(price~carat|factor(color),data=myd,pch=16,cex=0.7,
       groups=factor(cut),type=c("p","g"),
       main="Diamond Price vs Carat Size",
       auto.key=list(title="Diamond Quality",cex=1,columns=1,corner=c(1,1)))

##Problem 3
par(mfrow=c(1,1))
plot.ci=function(ci,mean){
  plot(ci[,1],1:length(ci[,1]),type="n",
       main="Confidence Intervals",
       xlim=c(min(ci[,1])-0.1,max(ci[,2])+0.1),
       ylim=c(1,length(ci[,1])),
       xlab=" ",ylab=" ",yaxt="n")
  abline(v=mean,lty=1,lwd=1,col="black",cex=0.8)
  
  bl=which(ci[,1] <= mean & ci[,2] >= mean)
  for (i in bl){segments(x0=ci[i,1],y0=i,x1=ci[i,2],col="blue")}
  
  rl=which(ci[,1] > mean |ci[,2] < mean)
  for (i in rl){segments(x0=ci[i,1],y0=i,x1=ci[i,2],col="red")}
  
  return(rl)
}


set.seed(199)
x=rnorm(100,10)
smean=mean(x)
sci=replicate(100,t.test(sample(x,rep=T))$conf.int)
sci=t(sci)
plot.ci(sci,smean)


set.seed(430)
x=rnorm(100,10)
smean=mean(x)
sci=replicate(100,t.test(sample(x,rep=T))$conf.int)
sci=t(sci)
plot.ci(sci,smean)

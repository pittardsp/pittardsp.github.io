####LIU_ANRAN_HW3####

#####################
#####Question 1######
plot.two<-function(){
  par(mfrow=c(1,2))
  ###Plot on the left##
  plot(mtcars$wt,mtcars$mpg,pch=20,xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight",
       col=cut(mtcars$mpg,breaks=quantile(mtcars$mpg),include.lowest=T,labels=c("black","red","green","blue")))
  abline(h=quantile(mtcars$mpg),lty=1:5,lwd=1,col="gray70")
  text(4.5,quantile(mtcars$mpg),label=names(quantile(mtcars$mpg)), col="black", cex=1)
  legend("topright",inset=c(0.18,0.08),legend=c("0-25","25-50","50-75","75-100"),
         title="Quantiles",pch=20,col=c("black","red","green","blue"),bg="grey90")
  ###Plot on the right##
  plot(mtcars$wt,mtcars$mpg,pch=20,xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight",
       col=cut(mtcars$wt,breaks=quantile(mtcars$wt),include.lowest=T,labels=c("black","red","green","blue")))
  abline(v=quantile(mtcars$wt),lty=1:5,lwd=1,col="gray70")
  mtext(round(quantile(mtcars$wt),1.1),at=quantile(mtcars$wt),side=3,col="black", cex=1)
  legend("topright",legend=c("0-25","25-50","50-75","75-100"),title="Quantiles",
         pch=20,col=c("black","red","green","blue"),bg="grey90")
}
plot.two()


#####################
#####Problem 2a######
url="http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows=read.table(url,header=T)
attach(sparrows)
par(mfrow=c(1,1))
mycols = colorRampPalette(c("white","steelblue"))( 7 )
(box<-boxplot(Wt~Observer,varwidth=TRUE,main="Sparrow Weight by Observer",
        ylab="Sparrow Weight",xlab="Observer Number",col=mycols,notch=TRUE))
mtext(box$n,at=1:7,side=3,col="red")
grid()

#####################
#####Problem 2b######
library(lattice)
library(ggplot2)
attach(diamonds)
xyplot(price~carat|factor(color),
       data=diamonds,pch=16,
       main="Diamond Pricevs Carat Size",type=c("p","g"),
       groups=factor(cut),auto.key=list(x=0.6,y=0.96,title="Diamond Quality"))

#####################
####Problem #3#######

plot.ci<-function(ci,sm){
  n=length(ci[,1])
  lx=min(ci[,1])-0.1
  ux=max(ci[,2])+0.1
  plot(ci[,1],1:n,xlim=c(lx,ux),ylim=c(1,n),type="n",xlab=" ",ylab=" ",yaxt="n",main="Confidence intervals")
  abline(v=sm,lty=1,lwd=1,col="black",cex=0.8)
  b=which(ci[,1]<=sm&ci[,2]>=sm)
  for (i in b){segments(x0=ci[i,1],x1=ci[i,2],y0=i,col="blue")}
  r=which(ci[,1]>sm|ci[,2]<sm)
  for (i in r){segments(x0=ci[i,1],x1=ci[i,2],y0=i,col="red")}
  return(r)
}
set.seed(199)
x=rnorm(100,10)
smean=mean(x)
sci=replicate(100,t.test(sample(x,rep=T))$conf.int)
sci=t(sci)
plot.ci(sci,smean)






#############################
### Homework 3 by Yi Deng ###
#############################


##1##
plot.1=function(){
par(mfrow=c(1,2))
attach(mtcars)
plot(wt,mpg,xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight",pch=20,col=cut(mpg,breaks=quantile(mpg),include.lowest=T,labels=c("black","red","green","blue")))
abline(h=quantile(mpg),lty=1:5,col="gray")
text(4.5,quantile(mpg),labels=names(quantile(mpg)))
legend(3.5,33,c("0-25","25-50","50-75","75-100"),bg="gray90",title=c("Quantiles"),col=c("black","red","green","blue"),pch=20)

plot(wt,mpg,xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight",pch=20,col=cut(wt,breaks=quantile(wt),include.lowest=T,labels=c("black","red","green","blue")))
abline(v=quantile(wt),lty=1:5,col="gray")
legend("topright",c("0-25","25-50","50-75","75-100"),bg="gray90",title=c("Quantiles"),col=c("black","red","green","blue"),pch=20)
mtext(round(quantile(wt),1),side=3,at=quantile(wt))
}

plot.1()   ##call the function##

##2##
#2.1#
dev.off()
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
rgb.exact=rgb(57,136,192,maxColorValue=255)  ##The exact rgb values are grabbed from matlab##
ramp=colorRamp(c("white",rgb.exact))  #Use the exact rgb values here; for requirment of the homework, we could also call the name of the color, such as "blue"#
(temp=boxplot(sparrows$Wt~sparrows$Observer,col=rgb(ramp(seq(0,1,length=7)),max=255),varwidth=TRUE,notch=TRUE,xlab="Observer Number",ylab="Sparrow Weight",main="Sparrow Weight by Observer"))
mtext(temp$n,side=3,at=1:7,col="red")
grid()
#2.2#
library("lattice")
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")
xyplot(price~carat|color,data=myd,groups=factor(cut),main="Diamond Price vs Carat Size",type=c("p","g"),auto.key=list(title="Diamond Quality",x = 0.6,y=0.75,corner = c(0, 0)))
     #####Please use this xyplot in R, otherwise it will not display the same as what is required.#########


##3##
set.seed(199)
x=rnorm(100,10)
smean=mean(x)
sci=replicate(100,t.test(sample(x,rep=T))$conf.int)
sci=t(sci)

plot.ci=function(sci,smean){
  plot.new()
  center=mean(apply(sci,1,mean))
  mmax=max(sci)
  mmin=min(sci)
  xlim=c(center-1.1*(center-mmin),center+1.1*(mmax-center))
  plot(NULL,NULL,xlim=xlim,ylim=c(0,1),xlab=c(""),ylab=c(""),yaxt='n',main="Confidence Intervals")
  abline(v=smean)
  n=dim(sci)[1]
  y=(1:n)/n
  flag=rep(0,n)
  for(i in 1:n){
    if(sci[i,1]>smean | sci[i,2]<smean){
      segments(sci[i,1],y[i],sci[i,2],y[i],col="red")
      flag[i]=1
    }
    else segments(sci[i,1],y[i],sci[i,2],y[i],col="blue")   
  }
  return(which(flag==1))
}

plot.ci(sci,smean)






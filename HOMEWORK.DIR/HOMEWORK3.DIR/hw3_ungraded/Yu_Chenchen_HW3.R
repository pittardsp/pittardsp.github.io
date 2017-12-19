###Yu_Chenchen_HW3###

####1####
plot.problem1=function(){
  attach(mtcars)
  par(mfrow=c(1,2))
  
  plot(wt,mpg,xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight",pch=16,col=cut(mpg,breaks=quantile(mpg),include.lowest=T,labels=c("black","red","green","blue")))
  abline(h=quantile(mpg),lty=1:5,col="gray80")
  text(4.5,quantile(mpg),labels=names(quantile(mpg)))
  legend(3.5,33,c("0-25","25-50","50-75","75-100"),bg="gray90",title=c("Quantiles"),col=c("black","red","green","blue"),pch=16)
  
  plot(wt,mpg,xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight",pch=16,col=cut(wt,breaks=quantile(wt),include.lowest=T,labels=c("black","red","green","blue")))
  abline(v=quantile(wt),lty=1:5,col="gray80")
  legend("topright",c("0-25","25-50","50-75","75-100"),bg="gray90",title=c("Quantiles"),col=c("black","red","green","blue"),pch=16)
  mtext(round(quantile(wt),1),side=3,at=quantile(wt))
  
}

plot.problem1()

####2####
####2a####
par(mfrow=c(1,1))
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
rgb.exact=rgb(57,136,192,maxColorValue=255)
mycols=colorRampPalette(c("white",rgb.exact))(7)
hold = boxplot(Wt~Observer,data=sparrows,notch=TRUE,col=mycols,main="Sparrow Weight by Observer",xlab="Observer Number",ylab="Sparrow Weight")
mtext(at=1:7,hold$n,col="red")

grid()
####2b####
library("lattice")
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")
xyplot(price~carat|factor(color),data=myd,main="Diamond Price vs Carat Size",type=c("g","p"),pch=16,groups=factor(cut),auto.key=list(title="Diamond Quality",corner=c(1,1)),layout=c(3,3))

####3####
set.seed(199)
x=rnorm(100,10)
smean=mean(x)

sci=replicate(100,t.test(sample(x,rep=T))$conf.int)
sci=t(sci)

plot.ci=function(sci,smean){
center=mean(apply(sci,1,mean))
max=max(sci)
min=min(sci)
xlim=c(center-1.1*(center-min),center+1.1*(max-center))
  
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



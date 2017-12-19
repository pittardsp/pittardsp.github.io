#######Q1
data(mtcars)
quantile(mtcars$mpg)
quantile(mtcars$wt)
my.cars<-function()
{
par(mfrow=c(1,2))
plot(mtcars$wt,mtcars$mpg,type="n",xlab="Weight in lbs/1,000",
     ylab="MPG", main="MPG vs. Weight")
first<-subset(mtcars,mtcars$mpg<=15.425)
a<-subset(mtcars,mtcars$mpg>15.425)
second<-subset(a,a$mpg<=19.200)
b<-subset(mtcars,mtcars$mpg>19.200)
third<-subset(b,b$mpg<=22.800)
fourth<-subset(mtcars,mtcars$mpg>22.800)
# Use the points command to plot each group
points(first$wt,first$mpg,pch=20,col="black")
points(second$wt,second$mpg,pch=20,col="red")
points(third$wt,third$mpg,pch=20,col="green")
points(fourth$wt,fourth$mpg,pch=20,col="blue")
# Draw a vertical line where the mean(wt) is
abline(h=10.400,lty=1,col="gray90")
abline(h=15.425,lty=2,col="gray90")
abline(h=19.200,lty=3,col="gray90")
abline(h=22.800,lty=4,col="gray90")
abline(h=33.900,lty=5,col="gray90")
text(c(4.2,4.2,4.2,4.2,4.2),c(10.400,15.425,19.200,22.800,33.900),
c("0%","25%","50%","75%","100%"),cex=0.6,pos=4,col="black")
legend(3.5,32,bg="gray",cex=0.6,c("0-25","25-50","50-75","75-100"),
       pch=20, col=c("black","red","green","blue"),title="Quantiles")

plot(mtcars$wt,mtcars$mpg,type="n",xlab="Weight in lbs/1,000",
     ylab="MPG", main="MPG vs. Weight")
first1<-subset(mtcars,mtcars$wt<=2.58125)
a1<-subset(mtcars,mtcars$wt>2.58125)
second1<-subset(a1,a1$wt<=3.32500)
b1<-subset(mtcars,mtcars$wt>3.32500)
third1<-subset(b1,b1$wt<=3.61000)
fourth1<-subset(mtcars,mtcars$wt>3.61000)
# Use the points command to plot each group
points(first1$wt,first1$mpg,pch=20,col="black")
points(second1$wt,second1$mpg,pch=20,col="red")
points(third1$wt,third1$mpg,pch=20,col="green")
points(fourth1$wt,fourth1$mpg,pch=20,col="blue")
# Draw a vertical line where the mean(wt) is
abline(v=1.51300,lty=1,col="gray90")
abline(v=2.58125,lty=2,col="gray90")
abline(v=3.32500,lty=3,col="gray90")
abline(v=3.61000,lty=4,col="gray90")
abline(v=5.42400,lty=5,col="gray90")
mtext(c("1.5","2.6","3.3","3.6","5.4"),at=c(1.5,2.6,3.3,3.6,5.4),cex=0.6,col="black")
legend("topright",bg="gray",cex=0.6,c("0-25","25-50","50-75","75-100"),
       pch=20, col=c("black","red","green","blue"),title="Quantiles")
}
my.cars()
######Q2.a
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
a<-colorRampPalette(c("white","Blue"))
tmpvar=boxplot(Wt~Observer,data=sparrows,main="Sparrow Weight by Observer",
        xlab = "Observer Number",
        ylab = "Sparrow Weight",notch=TRUE,
        col=a(7), vertical=TRUE,varwidth=TRUE,
        names=c("2","3","4","5","6","7","8"))
mtext(at=1, text=tmpvar$n[1], side=3,col="red")
mtext(at=2, text=tmpvar$n[2], side=3,col="red")
mtext(at=3, text=tmpvar$n[3], side=3,col="red")
mtext(at=4, text=tmpvar$n[4], side=3,col="red")
mtext(at=5, text=tmpvar$n[5], side=3,col="red")
mtext(at=6, text=tmpvar$n[6], side=3,col="red")
mtext(at=7, text=tmpvar$n[7], side=3,col="red")
grid(col="gray")
#######2.b,needs lattic package
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")
library(lattice)
xyplot(price ~ carat|factor(color), data = myd, pch = 19, layout=c(3,3),
       main = "Diamond Price vs. Carat Size",groups=factor(cut),
       auto.key = list(title="Diamond Quality", cex=1.5,columns=1,
       corner=c(0.7,1.0)),type=c("p","g"))

##############Q3
set.seed(199)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci<-function(ci,mean)
{
plot(ci,xlim=c(min(ci),max(ci)), type = "n",ann=FALSE,yaxt='n')
title("Confidence Intervals")
a=0;
retvec=vector()
for(i in 1:100) 
{ 
  if(ci[i,1]>mean | ci[i,2]<mean)
  {a=a+1
   retvec[a]=i
   lines(x=c(ci[i,1],ci[i,2]),
         y=c(min(ci[,2])+(max(ci[,2])-min(ci[,2]))/length(ci[,2])*i
             ,min(ci[,2])+(max(ci[,2])-min(ci[,2]))/length(ci[,2])*i),
         col="red")
  }
  else
    lines(x=c(sci[i,1],ci[i,2]),
          y=c(min(ci[,2])+(max(ci[,2])-min(ci[,2]))/length(ci[,2])*i
              ,min(ci[,2])+(max(ci[,2])-min(ci[,2]))/length(ci[,2])*i),
          col="blue")
  abline(v=mean,lty=1,col="black")
}
return(retvec)
}
plot.ci(sci,smean)

set.seed(430)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci,smean)
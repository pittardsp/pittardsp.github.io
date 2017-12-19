## HW 3 ##

## Q1 ##

# create a function "plot" 
plot1 <- function(){
  par(mfrow=c(1,2)) 
  q = quantile(mtcars$mpg)
  colvec = ifelse(mtcars$mpg < q[2],"black",
                  ifelse(mtcars$mpg <= q[3],"red",
                         ifelse(mtcars$mpg <= q[4],"green","blue")
                  )
  )
  plot(mtcars$wt,mtcars$mpg,xlab="Weight/1,000",ylab="MPG", main="MPG vs. Weight",pch=20,col=colvec)
  abline(h=q,lty=1:5,col="gray90")
  text(4.5,q,names(q))
  legend(3.5,33,c("0-25","25-50","50-75","75-100"),
         col=c("black","red","green","blue"),bg="grey",pch=20,title="Quantiles")
  Q = quantile(mtcars$wt)
  colvec = ifelse(mtcars$wt < Q[2],"black",
                  ifelse(mtcars$wt <= Q[3],"red",
                         ifelse(mtcars$wt <= Q[4],"green","blue")
                  )
  )
  plot(mtcars$wt,mtcars$mpg,xlab="Weight/1,000",
       ylab="MPG", main="MPG vs. Weight",pch=20,col=colvec)
  abline(v=Q,lty=1:5,col="gray90")
  mtext(round(Q,1),side=3,at=Q)
  legend("topright", c("0-25","25-50","50-75","75-100"),
         col=c("black","red","green","blue"),
         bg="grey",pch=20,title="Quantiles")  
}
# use fucntion plot
plot1()

## 2.a ##
par(mfrow=c(1,1)) # Reset the plot window
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
(boxplot=boxplot(sparrows$Wt~sparrows$Observer,col=colorRampPalette(c("white","yellow"))(7),varwidth=TRUE,notch=TRUE,
        xlab="Observer Number",ylab="Sparrow Weight",main="Sparrow Weight by Observer"))
# I used a "yellow" palette here
mtext(at=1:7,boxplot$n,side=3,col="red")
grid()

## 2.b ##
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")
library(lattice)
xyplot(price ~ carat|factor(color),data = myd, pch=20,
       main = "Diamond Price VS Carat Size",
       groups = factor(cut),layout=c(3,3),
       auto.key=list(title="Diamond Quality",x=0.6,y=1),
       as.table=FALSE,type=c("p","g"))

## 3 ##
plot.ci <-function(sci, smean){
  a=mean(sort(sci))
  plot(NULL,NULL,xlim=c(a-1.1*(a-min(sci)),a+1.1*(max(sci)-a)),ylim=c(0,1),xlab=c(""),ylab=c(""),yaxt='n',main="Confidence Intervals")
  abline(v=smean)
  n=nrow(sci)
  flag=rep(0,n)
  for(i in 1:n){
    if(sci[i,1]>smean | sci[i,2]<smean){
      segments(sci[i,1],i/n,sci[i,2],i/n,col="red")
      flag[i]=1
    }
    else segments(sci[i,1],i/n,sci[i,2],i/n,col="blue")   
  }
  return(which(flag==1))
} 

# test 1 
set.seed(199)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci,smean)

# test 2
set.seed(430)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci,smean)
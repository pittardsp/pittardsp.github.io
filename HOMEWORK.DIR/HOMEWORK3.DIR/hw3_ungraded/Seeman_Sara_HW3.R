#Sara Seeman          HW3

#Question 1
plot1<-function(){
  fivey=fivenum(mtcars$mpg)
  fivex=fivenum(mtcars$wt)
  par(mfrow=c(1,2))
  
  plot(mtcars$wt,mtcars$mpg,type="n",xlab="Weight/1,000",
       ylab="MPG", main="MPG vs. Weight")
  tf=mtcars[mtcars$mpg<=fivey[2],]
  f=mtcars[fivey[2]<mtcars$mpg&mtcars$mpg<=fivey[3],]
  sf=mtcars[fivey[3]<mtcars$mpg&mtcars$mpg<=fivey[4],]
  msf=mtcars[mtcars$mpg>fivey[4],]
  points(tf$wt,tf$mpg,col="black",pch=20)
  points(f$wt,f$mpg,col="red",pch=20)
  points(sf$wt,sf$mpg,col="green",pch=20)
  points(msf$wt,msf$mpg,col="blue",pch=20)
  abline(h=fivey[1],lty=1,col="gray")
  text(4.5,fivey[1],"0%")
  abline(h=fivey[2],lty=2,col="gray")
  text(4.5,fivey[2],"25%")
  abline(h=fivey[3],lty=3,col="gray")
  text(4.5,fivey[3],"50%")
  abline(h=fivey[4],lty=4,col="gray")
  text(4.5,fivey[4],"75%")
  abline(h=fivey[5],lty=5,col="gray")
  text(4.5,fivey[5],"100%")
  legend(4,32.5,c("0-25","25-50","50-75","75-200"),title="Quantiles",col=c("black","red","green","blue"),pch=20,bg="light gray",cex=0.75)
  
  plot(mtcars$wt,mtcars$mpg,type="n",xlab="Weight/1,000",
       ylab="MPG", main="MPG vs. Weight")
  tf=mtcars[mtcars$wt<=fivex[2],]
  f=mtcars[fivex[2]<mtcars$wt&mtcars$wt<=fivex[3],]
  sf=mtcars[fivex[3]<mtcars$wt&mtcars$wt<=fivex[4],]
  msf=mtcars[mtcars$wt>fivex[4],]
  points(tf$wt,tf$mpg,col="black",pch=20)
  points(f$wt,f$mpg,col="red",pch=20)
  points(sf$wt,sf$mpg,col="green",pch=20)
  points(msf$wt,msf$mpg,col="blue",pch=20)
  abline(v=fivex[1],lty=1,col="gray")
  mtext(at=fivex[1], text=round(fivex[1],digits=1), side=3) 
  abline(v=fivex[2],lty=2,col="gray")
  mtext(at=fivex[2], text=round(fivex[2],digits=1), side=3) 
  abline(v=fivex[3],lty=3,col="gray")
  mtext(at=fivex[3], text=round(fivex[3],digits=1), side=3) 
  abline(v=fivex[4],lty=4,col="gray")
  mtext(at=fivex[4], text=round(fivex[4],digits=1), side=3) 
  abline(v=fivex[5],lty=5,col="gray")
  mtext(at=fivex[5], text=round(fivex[5],digits=1), side=3)
  legend("topright",c("0-25","25-50","50-75","75-200"),title="Quantiles",col=c("black","red","green","blue"),pch=20,bg="light gray",cex=0.75)
  
}
plot1()

#Question 2a
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
head(sparrows)

plot2a<-function(){
  par(mfrow=c(1,1))
  mycols = colorRampPalette(c("white","blue"))( 7 )
  tmpvar=boxplot(Wt~Observer,data=sparrows,main="Sparrow Weight by Observer",
                 ylab="Sparrow Weight",xlab="Observer Number",notch=TRUE,col=mycols)
  abline(v=2:8,lty=2,col="gray90")
  abline(h=c(16,18,20,22,24,26),lty=2,col="gray90")
  mtext(at=1, text=tmpvar$n[1], side=3,col="red")
  mtext(at=2, text=tmpvar$n[2], side=3,col="red")
  mtext(at=3, text=tmpvar$n[3], side=3,col="red")
  mtext(at=4, text=tmpvar$n[4], side=3,col="red")
  mtext(at=5, text=tmpvar$n[5], side=3,col="red")
  mtext(at=6, text=tmpvar$n[6], side=3,col="red")
  mtext(at=7, text=tmpvar$n[7], side=3,col="red")
}
plot2a()

#Question 2b
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")

library(lattice)
xyplot(price ~ carat | factor(color), data = myd, pch=16,
      main = "Diamond Price vs Carat Size",
      groups=factor(cut),type=c("p","g"),layout=c(3,3),
      auto.key = list(title="Diamond Quality", columns=1,corner=c(0.75,0.9)))

#Question 3
plot.ci<-function(sci,smean){
  par(mfrow=c(1,1))
  plot(sci,yaxt='n',main="Confidence Intervals",xlab="",ylab="",type="n",xlim=c((min(sci)-0.1),(max(sci)+0.1)),
       ylim=c(9.9,10.9))
  main="Confidence Intervals"
  abline(v=smean)
  counter=9.9
  for(i in 1:nrow(sci)){
    segments(sci[i,1],counter,sci[i,2],counter,
             if ((sci[i,1]<=smean&sci[i,2]>=smean)==TRUE){
               col="blue"}
             else if ((sci[i,1]<=smean&sci[i,2]>=smean)==FALSE){
               col="red"
             })
    counter=counter+0.01
  }
  v=c()
  for(j in 1:nrow(sci)){
    if ((sci[j,1]<=smean&sci[j,2]>=smean)==FALSE){
      v[j]=j
    }
    else if((sci[j,1]<=smean&sci[j,2]>=smean)==TRUE){
    }
  }
  v=v[which(v!="NA")]
  return(v)
}

set.seed(199)
x=rnorm(100,10)
smean=mean(x)
sci=replicate(100,t.test(sample(x,rep=T))$conf.int)
sci=t(sci)

plot.ci(sci,smean)

set.seed(430)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci,smean)


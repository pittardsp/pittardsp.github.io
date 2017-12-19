#Megan Warnock
#BIOS560R: Assignment 3

#1

car.plot<-function(dt,y,x){
  
  par(mfrow=c(1,2))
  
  linetype<-c(1:5)
  color<-c("black","red","green","blue")
  seperate1<-fivenum(y)
  seperate2<-fivenum(x)
  lab<-c("0%", "25%", "50%", "75%", "100%")
  sepr<-round(seperate2,1)
  
  colvec=ifelse(y<seperate1[2],"black", ifelse(y<seperate1[3], "red", ifelse(y<seperate1[4], "green","blue")))
  plot (x, y, main= "MPG vs Weight", xlab="Weight/1,000", ylab="MPG", abline(h=seperate1, col="gray90", lty=linetype), col=colvec,pch=19)
  legend("topright", inset=0.13,c("0-25","25-50","50-75","75-100"),title="Quantiles",bg="gray93",col=color,pch=19,cex=0.6) 
  text(4.5, seperate1, labels=lab,cex=0.6)
  
  colvec=ifelse(x<seperate2[2],"black", ifelse(x<seperate2[3], "red", ifelse(x<seperate2[4], "green","blue")))
  plot (x, y, main= "MPG vs Weight", xlab="Weight/1,000", ylab="MPG", abline(v=seperate2,col="gray90",lty=linetype), col=colvec,pch=19)
  legend("topright", c("0-25","25-50","50-75","75-100"),col=color,pch=19, bg="gray93",title="Quantiles",cex=0.6) 
  mtext(at=seperate2[1:5], text=sepr, cex=0.6)
  
}

car.plot(mtcars,mtcars$mpg,mtcars$wt)


#2a

url="http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows=read.table(url,header=T)

par(mfrow=c(1,1))

mysplit=split(sparrows,sparrows$Observer)
count<-matrix(sapply(mysplit,nrow))
mycols=colorRampPalette(c("azure","royalblue4"))( 7 )

boxplot(Wt~Observer, varwidth=TRUE, ylim=c(15,27),main="Sparrow Weight by Observer", xlab="Observer Number", ylab="Sparrow Weight",data=sparrows,notch=TRUE, col=mycols)
mtext(at=1:7, text=count[,1],col="red")
abline(v=c(2:8),lty=2,col="gray90")
abline(h=c(16,18,20,22,24,26),lty=2,col="gray90")

#2b

library(lattice)
url="http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd=read.csv(url,header=T,sep=",")

xyplot(price~carat|factor(color),data=myd, pch=19, group=factor(cut),main="Diamond Price vs Carat Size", xlab="carat",ylab="price", type=c("p","g"),layout=c(3,3),auto.key=list(title="Diamond Quality", cex=1,columns=1,corner=c(0.75,1)))


#3

plot.ci<-function(data,mean){
  par(mfrow=c(1,1))
  plot(data, type="n", ylim=c(0,length(data)),xlim=c(min(data)-0.1,max(data)+0.1),xlab="", ylab="",yaxt="n",main="Confidence Intervals")
  
  contain=vector()
  for (ii in 1:nrow(data)){
    if (data[ii,1]<=mean & data[ii,2] >=mean){
      contain[ii]=TRUE
    }
    else {
      contain[ii]=FALSE
    }
  }
  
  color=vector()
  for (ii in 1:nrow(data)){
    if (contain[ii]==TRUE){
      color[ii]="blue"
    } 
    else if (contain[ii]==FALSE) {
      color[ii]="red"  
    }
  }
  
  count=0
  for (ii in 1:nrow(sci)){
    segments(data[ii,1], 1+count, data[ii,2],1+count,col=color[ii])
    count=count+2
  }
  
  segments(mean,nrow(data)*(-2.5),mean, nrow(data)*2.5)
  
  nomean=which(!contain)
  return(nomean)
}


plot.ci(sci,smean)

set.seed(199)
x=rnorm(100,10)
smean=mean(x)
sci=replicate(100,t.test(sample(x,rep=T))$conf.int)
sci=t(sci)

set.seed(430)
x=rnorm(100,10)
smean=mean(x)
sci=replicate(100,t.test(sample(x,rep=T))$conf.int)
sci=t(sci)

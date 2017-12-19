#########################Yuqi Sun###############################

###############################11111111##########################
myfun<-function(mtcars){
a=cut(mtcars$mpg, breaks = fivenum(mtcars$mpg), labels = c("1","2","3","4"),include.lowest=T,right=T)
b=cut(mtcars$wt, breaks = fivenum(mtcars$wt), labels = c("1","2","3","4"),include.lowest=T,right=T)

par(mfrow = c(1, 2))
plot(mtcars$wt,mtcars$mpg,main = "MPG vs. Weight",xlab="Weight/1,000",ylab="MPG",col=c("black","red","green","blue")[as.factor(a)],pch=19)

legend("topright",inset=0.05,title="Quantiles",c("0-25","25-50","50-75","75-100"),pch=19,
       col=c("black","red","green","blue"),bg="lightgrey",cex=0.6,title.adj=0.15)
abline(h=quantile(mtcars$mpg),lty=c(2,3,4,5,6),col="grey")
text(5,quantile(mtcars$mpg),c("0%","25%","50%","75%","100%"),cex=0.6)

plot(mtcars$wt,mtcars$mpg,main = "MPG vs. Weight",xlab="Weight/1,000",ylab="MPG",col=c("black","red","green","blue")[as.factor(b)],pch=19)

legend(3.97,34.78,inset=0.05,title="Quantiles",c("0-25","25-50","50-75","75-100"),pch=19,
       col=c("black","red","green","blue"),bg="lightgrey",cex=0.6,title.adj=0.15)
abline(v=quantile(mtcars$wt),lty=c(2,3,4,5,6),col="grey")
mtext(at=quantile(mtcars$wt),round(quantile(mtcars$wt),1),cex=0.6)
}

myfun(mtcars)

##########################222222222222aaaaaaaaaaaaaaaaaaaa############################
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)

cpal<-colorRampPalette(c('white',"lightblue"))
boxplot(Wt ~ Observer,main = "Sparrow Weighted by Observer", data = sparrows, notch = TRUE,xlab="Observer Number",ylab="Sparrow Weight"
        ,varwidth=T,col=cpal(7))

mtext(at = 1:7,c(297,241,83,45,154,50,109),col="red",cex=0.8) 

####################22222222222222bbbbbbbbbbbbbbbb################################
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")
library(lattice)
xyplot(price~carat|color,groups=factor(cut),data=myd,pch=19,type=c("p","g"),
       auto.key=list(title="Diamond Quality",x=.6,y=.96),layout = c(3,3))

#################333333333333333333333333##############################

set.seed(199)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)

myfun2<-function(sci){
plot(sci,type="n",ylim=c(0,10),xlim=c(min(sci[,1])-0.1,max(sci[,2])+0.1),xlab="",ylab="", yaxt = "n")
for (ii in 1:nrow(sci)) {
  if(sci[ii,1]>smean|sci[ii,2]<smean){
  segments(sci[ii,1],0.1+ii*0.1,sci[ii,2],0.1+ii*0.1,col="red")
  }
  else{
    segments(sci[ii,1],0.1+ii*0.1,sci[ii,2],0.1+ii*0.1,col="blue") 
  }
}
abline(v=smean,col="darkblue")
}
myfun2(sci)



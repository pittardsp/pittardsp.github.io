#Question 1
question1<-function(){
par(mfrow=c(1,2))

col=cut(mtcars$mpg, breaks=quantile(mtcars$mpg, c(0,.25,.5,.75,1)), include.lowest=TRUE)
plot(mtcars$wt,mtcars$mpg,main="MPG vs Weight", xlab="Weight/1,000", ylab="MPG", 
     col=col, pch=20)
abline(h=c(min(mtcars$mpg), quantile(mtcars$mpg, probs=.25), 
           quantile(mtcars$mpg, probs=.5), quantile(mtcars$mpg, probs=.75), 
           max(mtcars$mpg)), lty=c(1,2,3,4,5), col="gray")
text(4.4, min(mtcars$mpg), "0%")
text(4.4, quantile(mtcars$mpg, probs=.25), "25%")
text(4.4, quantile(mtcars$mpg, probs=.5), "50%")
text(4.4, quantile(mtcars$mpg, probs=.75), "75%")
text(4.4, quantile(mtcars$mpg, probs=1), "100%")
legend(3.4,33, legend=c("0-25","25-50","50-75","75-100"), title="Quantiles", 
       col=c("black","red", "green", "blue"), pch=20, bg="grey90")

col=cut(mtcars$wt, breaks=quantile(mtcars$wt, c(0,.25,.5,.75,1)), include.lowest=TRUE)
plot(mtcars$wt,mtcars$mpg,main="MPG vs Weight", xlab="Weight/1,000", ylab="MPG",
     col=col, pch=20)
abline(v=c(min(mtcars$wt), quantile(mtcars$wt, probs=.25), 
           quantile(mtcars$wt, probs=.5), quantile(mtcars$wt, probs=.75), 
           max(mtcars$wt)), lty=c(1,2,3,4,5), col="gray")
mtext(round(min(mtcars$wt),1),3, at=min(mtcars$wt))
mtext(round(quantile(mtcars$wt, probs=.25),1), 3, at=quantile(mtcars$wt, probs=.25))
mtext(round(quantile(mtcars$wt, probs=.5),1), 3, at=quantile(mtcars$wt, probs=.5))
mtext(round(quantile(mtcars$wt, probs=.75),1), 3, at=quantile(mtcars$wt, probs=.75))
mtext(round(max(mtcars$wt),1), 3, at=max(mtcars$wt))
legend("topright", legend=c("0-25","25-50","50-75","75-100"), title="Quantiles", 
       col=c("black","red", "green", "blue"), pch=20, bg="grey90")

par(mfrow=c(1,1))
}

#Question 2a
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)

colors=colorRampPalette(c("white","steelblue"))(7)
boxplot(Wt~Observer,data=sparrows, main="Sparrow Weight by Observer",
        xlab="Observer Number", ylab="Sparrow Weight", notch=T, varwidth=T,
        col=colors)
grid(col="gray")

mtext(tapply(sparrows$Wt, sparrows$Observer, length), 3, at=1:7, col="red")

#Question 2b
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")

xyplot(price~carat|color, data=myd, groups=factor(cut), pch=16, layout=c(3,3),
       main="Diamond Size vs Carat Size", 
       auto.key=list(title="Diamond Quality",corner=c(.70,.9)))

#Question 3

set.seed(199)
x = rnorm(100,10)
smean = mean(x)

sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)

plot.ci<-function(sci,smean){
  
  colforplot=c()
  
  for(i in 1:nrow(sci)){
    if (sci[i,1]>smean) {
      colforplot[i]="red"
    }
    else if (sci[i,2]<smean){
      colforplot[i]="red"
    }
    else{colforplot[i]="blue"}
  }


  plot(y=1:nrow(sci), x=x, ylab="", xlab="", main="Confidence Intervals", type="n",
       xlim=c(min(sci[,1]),max(sci[,2])), yaxt="n")


for(i in 1:nrow(sci)){
 segments(sci[i,1],i, sci[i,2], i, col=colforplot[i])
}
abline(v=smean)

return(which(colforplot=="red"))
}

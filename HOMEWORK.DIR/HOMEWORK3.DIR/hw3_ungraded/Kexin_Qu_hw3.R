###Q1###
question_one=function(){
par(mfrow=c(1,2))
######
plot(mtcars$wt, mtcars$mpg,main="MPG vs. Weight",xlab="Weight/1,000",ylab="MPG",type="n",pch =20)
q=quantile(mtcars$mpg)
q1= mtcars[q[[1]]<=mtcars$mpg & mtcars$mpg<=q[[2]], ]
q2= mtcars[q[[2]]<mtcars$mpg  & mtcars$mpg<=q[[3]], ]
q3= mtcars[q[[3]]<mtcars$mpg  & mtcars$mpg<=q[[4]], ]
q4= mtcars[q[[4]]<mtcars$mpg  & mtcars$mpg<=q[[5]], ]
points(q1$wt,q1$mpg,col="black",pch=20)
points(q2$wt,q2$mpg,col="red",pch=20)
points(q3$wt,q3$mpg,col="green",pch=20)
points(q4$wt,q4$mpg,col="blue",pch=20)
abline(h=c(q[[1]],q[[2]],q[[3]],q[[4]],q[[5]]),lty=c("solid","dashed","dotted","dotdash","longdash"),col="gray")
legend(3.4,33,title="Quantiles",inset=c(0.18,0.08), c("0-25","25-50","50-75", "75-100"
), pch=20, cex=0.7,col=c("black","red","green","blue"),bg="grey90")
text(4.5,q[[1]],paste("0%"),cex=0.8)
text(4.5,q[[2]],paste("25%"),cex=0.8)
text(4.5,q[[3]],paste("50%"),cex=0.8)
text(4.5,q[[4]],paste("75%"),cex=0.8)
text(4.5,q[[5]],paste("100%"),cex=0.8)

######
plot(mtcars$wt, mtcars$mpg,main="MPG vs. Weight",xlab="Weight/1,000",ylab="MPG",type="n",pch = 20)
q=quantile(mtcars$wt)
q1= mtcars[q[[1]]<=mtcars$wt & mtcars$wt<=q[[2]], ]
q2= mtcars[q[[2]]<mtcars$wt  & mtcars$wt<=q[[3]], ]
q3= mtcars[q[[3]]<mtcars$wt  & mtcars$wt<=q[[4]], ]
q4= mtcars[q[[4]]<mtcars$wt  & mtcars$wt<=q[[5]], ]
points(q1$wt,q1$mpg,col="black",pch=20)
points(q2$wt,q2$mpg,col="red",pch=20)
points(q3$wt,q3$mpg,col="green",pch=20)
points(q4$wt,q4$mpg,col="blue",pch=20)
abline(v=c(1.5,2.6,3.3,3.6,5.4),lty=c("solid","dashed","dotted","dotdash","longdash"),col="gray")
legend("topright",inset=0, title="Quantiles",c("0-25","25-50","50-75", "75-100"
), pch=20, col=c("black","red","green","blue"),bg="grey90", cex=0.7)
mtext(round(quantile(mtcars$wt),1.1),at=quantile(mtcars$wt),side=3,col="black", cex=0.7)

}

question_one()

###Q2###
##2a###
par(mfrow=c(1,1))
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
colfunc <- colorRampPalette(c("white","steelblue"))
boxplot(Wt~Observer,  data=sparrows,notch=TRUE, varwidth=TRUE,
        main="Sparrow Weight by Observer",xlab="Observer Number",ylab="Sparrow Weight",col=colfunc(7))
grid(col="grey")

for(i in 2:8){
     
     mtext(length(which(sparrows$Observer==i)),
           3,at=i-1,cex=0.8,col="red")
}

###2b
par(mfrow=c(1,1))
library(lattice)
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")

xyplot(price~ carat | factor(color), data = myd, cex=0.7,pch=16,type=c("p","g"),
       main = "Diamond Price vs Carat Size",
       groups=factor(cut),
       auto.key=list(title="Diamond Quality",corner=c(0.8,1),cex=1,columns=1))

###Q3###

plot.ci=function(data,mean){  
plot(data,type="n",main="Confidence Intervals",xlim=c(min(data)-0.1,max(data)+0.1),ylim=c(0,104),ylab="",xlab="",yaxt="n")
row=numeric(0)
for (i in 1:100) {
  if(mean<data[i,1] || mean>data[i,2]){
  segments(data[i,1],2+i,data[i,2],2+i,col="red")
  row=c(row,i)
  }else{
  segments(data[i,1],2+i,data[i,2],2+i,col="blue")
  }
}
abline(v=mean,lty=1,lwd=1,col="black",cex=0.8)
return(row)
}

par(mfrow=c(1,1))

set.seed(199)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci,smean)

set.seed(430)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci,smean)


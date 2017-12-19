#Jordan Kennedy
#HW3

#Question 1

my.func<-function(){
par(mfrow=c(1,2))

hnum<-quantile(mtcars$mpg)
ref<-cut(mtcars$mpg,hnum,include.lowest=T)
plot(mtcars$wt,mtcars$mpg,main="MPG vs Weight",xlab="Weight/1,000",ylab="MPG",col=ref,pch=20)
abline(h=hnum,lty=c(1,2,3,4,5),col="gray")
text(x=4.4,y=hnum,c("0%","25%","50%","75%","100%"),col="black")
legend(x=3.5,y=33,legend=c("0-25","25-50","50-75","75-100"),title="Quantiles",pch=16,col=c("black","red","green","blue"),bg="gray90")

vnum<-quantile(mtcars$wt)
ref2<-cut(mtcars$wt,vnum,include.lowest=T)
plot(mtcars$wt,mtcars$mpg,main="MPG vs Weight",xlab="Weight/1,000",ylab="MPG",col=ref2,pch=20)
abline(v=vnum,lty=c(1,2,3,4,5),col="gray")
vnumr<-round(vnum,digits=1)
mtext(vnumr,side=3,at=vnum)
legend("topright",legend=c("0-25","25-50","50-75","75-100"),title="Quantiles",pch=16,col=c("black","red","green","blue"),bg="gray90")

par(mfrow=c(1,1))
}



#Question 2a
par(mfrow=c(1,1))

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)

mcol<-colorRampPalette(c("white","steelblue"))(7)
boxplot(Wt~Observer,data=sparrows,main="Sparrow Weight By Observer",xlab="Observer Number",ylab="Sparrow Weight",notch=T,varwidth=T,col=mcol)
grid(col="gray")
ref3<-tapply(sparrows$Wt,sparrows$Observer,length)
mtext(ref3,side=3,at=1:7,col="red")


#Question 2b

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")

library(lattice)
xyplot(price~carat|color,data=myd,groups=cut,pch=16,main="Diamond Price vs Carat Size",auto.key=list(title="Diamond Quality",corner=c(0.75,1)),screens=c(1,1,1,2,2,3,3))




#Question 3
set.seed(199)
x = rnorm(100,10)
smean = mean(x)

sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)

plot.ci<-function(sci,smean){
n<-length(sci)/2
ulim<-round(min(sci),1)-.1
llim<-round(max(sci),1)+.1
ab<-vector()
plot(x=sci[,1],1:nrow(sci),type="n",main="Confidence Intervals",ylab="",xlab="",yaxt="n",xlim=c(ulim,llim),ylim=c(0,n))
abline(v=smean,lty=1)

for(i in 1:nrow(sci))
{
	if ((sci[i,1] <= smean) && (sci[i,2] >= smean)){
		segments(sci[i,1],i,sci[i,2],i,col="blue")
		ab[i]="blue"}
	else {
segments(sci[i,1],i,sci[i,2],i,col="red")
ab[i]="red"
}
}

return(grep("red",ab))
}




# BIOS 560R
# Wanzhe Zhu
# Homework 3

# 1
carsgraph <- function(df = mtcars,x = mtcars$wt,y = mtcars$mpg) {
	par(mfrow=c(1,2))
	plot(x,y,type="n",main="MPG vs Weight",xlab="Weight/1,000",ylab="MPG")
	points(x,y,col=findInterval(y,quantile(y,type=5),rightmost.closed=T),pch=16)
	z = fivenum(y)
	abline(h=z,col="lightgray",lty=1:5)
	text(4.5,z[1],"0%")
	text(4.5,z[2],"25%")
	text(4.5,z[3],"50%")
	text(4.5,z[4],"75%")
	text(4.5,z[5],"100%")
	legend("topright",y.intersp=0.7,ncol=1,pch=16,col=1:4,bg="lightgray",
		legend=c("0-25","25-50","50-75","75-100"),title="Quantiles",inset=0.07)

	plot(x,y,type="n",main="MPG vs Weight",xlab="Weight/1,000",ylab="MPG")
	points(x,y,col=findInterval(x,quantile(x,type=5),rightmost.closed=T),pch=16)
	z = fivenum(x)
	abline(v=z,col="lightgray",lty=1:5)
	mtext(round(z,1),side=3,line=0,at=z) # append text on top margin
	legend("topright",y.intersp=0.7,ncol=1,pch=16,col=1:4,bg="lightgray",
		legend=c("0-25","25-50","50-75","75-100"),title="Quantiles")
}
carsgraph()

# 2A
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
library(RColorBrewer)
par(mfrow=c(1,1))
boxplot(sparrows$Wt~sparrows$Observer,main="Sparrow Weight by Observer",notch=T,
	xlab="Observer Number",ylab="Sparrow Weight",col=brewer.pal(8,"Blues"),
	varwidth=T,outcex=2) # varwidth changes width by sqrt(group size)
mtext(table(sparrows$Observer),side=3,line=0,col="red",at=1:7)
grid(col="gray") # lty by default is 3

# 2B
dialattice <- function() {
	url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
	myd = read.csv(url,header=T,sep=",")

	library(lattice)
	xyplot(price~carat|factor(color),main="Diamond Price vs Carat Size",groups=cut,
		data=myd,auto.key=list(title="Diamond Quality",corner=c(0.75,1)),pch=20,
		type=c("p","g"))

	# auto.key autogenerates legend
	# corner puts legend as part of graph instead of by itself
	# type: p - points, l - lines, g - grids
}
dialattice()

# 3
plot.ci <- function(ci,v) {
	len = nrow(ci)
	lim = c(min(ci),max(ci))
	plot(sci[,1],1:100,type="n",main="Confidence Intervals",xlim=lim,xlab="",yaxt="n",ylab="")
	col=apply(sci,1,function(var) {ifelse((var[1]<v)&(var[2]>v),"blue","red")})
	for(i in 1:len) segments(ci[i,1],i,ci[i,2],i,col=col[i])
	abline(v=v)
	ret = which(col=="red")
	return(ret)
}

## test data 1
set.seed(199)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci,smean)

## test data 2
set.seed(430)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci,smean)

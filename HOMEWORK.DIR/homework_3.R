plot(mtcars$wt,mtcars$mpg,main="MPG vs Weight", type="n",ylab="MPG",xlab="Weight in Lbs/1,000")
mylines = quantile(mtcars$wt,prob=c(.25,.75))
abline(v=mylines[1],lty=2)
abline(v=mylines[2],lty=2)
under25p = subset(mtcars, wt <= mylines[1])
gt25plt75p = subset(mtcars, wt > mylines[1] & wt < mylines[2] )
gt75 = subset(mtcars, wt >= mylines[2])
points(under25p$wt,under25p$mpg, pch=19,col="black")
points(gt25plt75p$wt,gt25plt75p$mpg, pch=19, col="red")
points(gt75$wt,gt75$mpg,pch=19,col="blue")
legend("topright",c("0-25","25-75","75-100"),fill=c("black","red","blue"),title="Quantiles",bg='gray')


# Problem 2

url = "http://www.bimcore.emory.edu/BIOS560R/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
mycols = colorRampPalette(c("blue","green"))(7)
hold = boxplot(Wt~Observer,data=sparrows,notch=T,varwidth=TRUE,col=mycols,main="Sparrow Weight by Observer")
mtext(at=1:7,text=hold$n,side=3,col="red")

# Problem 3

xyplot(Sepal.Length~Sepal.Width|Season,data=iris2,group=Species,auto.key=list(columns=3,title="Species"),pch=21,main="Season Plot with Species Groups")





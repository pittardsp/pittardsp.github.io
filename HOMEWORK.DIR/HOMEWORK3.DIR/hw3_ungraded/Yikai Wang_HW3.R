########################   Question 1   ########################


Question1 <-function(dataset)
{
library(lattice)

mpg_info = fivenum(dataset$mpg)
wt_info = fivenum(dataset$wt)



MPGlist = list()
WTlist = list()

for(i in 1:4)
{
MPGlist[[i]] = dataset[mpg_info[i]<=dataset$mpg & dataset$mpg<=mpg_info[i+1],]
WTlist[[i]] = dataset[wt_info[i]<=dataset$wt & dataset$wt<=wt_info[i+1],]
}
test1=paste(seq(0,100,25),"%",sep="")
colo=c("black","red","green","blue")

par(mfrow = c(1,2)) 

#### Figure 1 ####

plot(dataset$wt,dataset$mpg,type="n",xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight")
for(i in 1:4)
{
points(MPGlist[[i]]$wt,MPGlist[[i]]$mpg,col=colo[i],pch=16)
}
abline(h=mpg_info,lty=c(1:5),col="gray80")
text(4.3,mpg_info,test1,cex=0.9)
legend("topright",inset=0.05,c("0-25","25-50","50-75","75-100"),pch=16,col=colo,title="Quantiles",bg="gray90",cex=0.9)

#### Figure 2 ####

plot(dataset$wt,dataset$mpg,type="n",xlab="Weight/1,000",ylab="MPG",main="MPG vs Weight")
for(i in 1:4)
{
points(WTlist[[i]]$wt,WTlist[[i]]$mpg,col=colo[i],pch=16)
}
abline(v=wt_info,lty=c(1:5),col="gray80")
legend("topright",inset=0,c("0-25","25-50","50-75","75-100"),pch=16,col=colo,title="Quantiles",bg="gray90",cex=0.9)
mtext(round(wt_info,1),3,at=wt_info,cex=0.9)
}


Question1(mtcars)

############################  END  #############################






#######################   Question 2.a   #######################


url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
x11()
par(mfrow=c(1,1))

mycols=colorRampPalette(c("white","purple"))(7)

hold = boxplot(Wt~Observer,data=sparrows,notch=TRUE,col=mycols,main="Sparrow Weight by Observer",xlab="Observer Number",ylab="Sparrow Weight")

grid()

mtext(at=1:7,hold$n,col="red")


#######################   Question 2.b   #######################

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")

library(lattice)
x11()
par(mfrow=c(1,1))
xyplot(price~carat|factor(color),data=myd,main="Diamond Price vs Carat Size",type=c("g","p"),pch=16,groups=factor(cut),auto.key=list(title="Diamond Quality",corner=c(1,1)),layout=c(3,3))




########################   Question 3   ########################
set.seed(199)
x = rnorm(100,10)
smean = mean(x)

sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)



plot.ci <-function(sci, smean)
{
library(lattice)
includ=vector()
not_inc=vector()
y_high=vector()

par(mfrow=c(1,1))

k=1 
for(i in 1:nrow(sci)){ 
if(sci[i,1]<=smean & sci[i,2]>smean){includ[i]=1}
else{includ[i]=0
not_inc[k]=i               # needed be returned
k=k+1}
if(i==1){y_high[i]=0.5}
else{y_high[i]=y_high[i-1]+0.2}
}

buffer=(sci[1,2]-sci[1,1])/10
rangey=c(y_high[1],y_high[nrow(sci)])
rangex=c(round(min(sci[,1])-buffer,1),round(max(sci[,2])+buffer,1))

plot(rangex,rangey,main="Confidence Intervals",type="n",xlab="",ylab="",axes=F)
axis(1, seq(rangex[1],rangex[2],0.2), col.axis = "black")
box()

abline(v=smean)


segments(sci[,1],y_high,sci[,2],y_high,col="red")

segments(sci[sci[,1]<=smean & sci[,2]>smean,1],y_high[sci[,1]<=smean & sci[,2]>smean],sci[sci[,1]<=smean & sci[,2]>smean,2],y_high[sci[,1]<=smean & sci[,2]>smean],col="blue")


return(not_inc)
}






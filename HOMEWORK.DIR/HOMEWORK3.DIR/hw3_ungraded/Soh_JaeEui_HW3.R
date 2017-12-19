
#####################
#   BIOS560R (by Steve Pittard)
#   HW3 (due by 25 February,2014)
#   JaeEui (Jay) Soh
#####################

#
# 1. 


myPlots=function(data=mtcars){
  
  y=mtcars$mpg
  x=mtcars$wt
  
  my5y=fivenum(y)
  my5x=fivenum(x)
  color=c("Black","Red","Green","Blue")
  color1=ifelse(y>my5y[4],"Blue",ifelse(y>my5y[3],"Green",ifelse(y>my5y[2],"Red","Black")))
  color2=ifelse(x>my5x[4],"Blue",ifelse(x>my5x[3],"Green",ifelse(x>my5x[2],"Red","Black")))
  
  par(mfrow=c(1,2))
  
  plot(x,y,type="n",main="MPG vs Weight",xlab="Weight/1,000",ylab="MPG")
  
  points(x,y,pch=19,col=color1,cex=1)
  abline(h=my5y,lty=1:5,col="gray90")
  text(4.5,my5y,c("0%","25%","50%","75%","100%"))
  legend(3.5,sort(y)[length(y)-1],title="Quantiles",legend=c("0-25","25-50","50-75","75-100"),pch=19,col=color,bg="gray90",cex=0.75,pt.cex=1)
  
  
  
  plot(x,y,type="n",main="MPG vs Weight",xlab="Weight/1,000",ylab="MPG")
  
  points(x,y,pch=19,col=color2,cex=1)
  abline(v=my5x,lty=1:5,col="gray90")
  mtext(round(my5x,1),side=3,line=0,at=my5x)
  legend("topright",title="Quantiles",legend=c("0-25","25-50","50-75","75-100"),pch=19,col=color,bg="gray90",cex=0.75,pt.cex=1)
  
}

myPlots()



#
# 2 - a)



rm(list=ls())
par(mfrow=c(1,1))
url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)

wt=sparrows$Wt
obs=sparrows$Observer
mtext3=c(sum(obs==2),sum(obs==3),sum(obs==4),sum(obs==5),sum(obs==6),sum(obs==7),sum(obs==8))


boxplot(wt~obs, notch=TRUE,width = sqrt(mtext3),
        main="Sparrow Weight by Observer",ylab="Sparrow Weight",xlab="Observer Number",
        col=colorRampPalette(c("White","deepskyblue4"))(length(unique(obs)))
)

abline(v=2:8,lty=2,col="gray90")
abline(h=seq(2,30,2),lty=2,col="gray90")
mtext(mtext3,side=3,at=unique(obs)-1,col="red")




#
# 2 - b)

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")


library(lattice)

xyplot(price~carat|factor(color),groups=factor(cut),
       type=c("p","g"),layout=c(3,3),pch=19,
       auto.key=list(title ="Diamond Quality",corner = c(1,1),x=0.8,y=1,cex=1),
       data=myd,main="Diamond Price vs Carat Size")








#
# 3.



plot.ci=function(sci,smean){
  

color=ifelse((sci[,1]<smean) & (sci[,2] > smean),"Blue","Red")

plot(1:100,xlab="",ylab="",yaxt="n",
     xlim=c(min(sci[,1]),max(sci[,2])),ylim=c(0,100),
     type="n",main="Confidence Intervals")
abline(v=smean)
for(i in 1:nrow(sci)){
  segments(sci[i,1],i,sci[i,2],i,col=color[i])
}

gr=grep("Red",color)
return(gr)
}



set.seed(199)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)



plot.ci(sci, smean)



# Example of 'plot.ci' function

set.seed(430)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)

plot.ci(sci, smean)
my.function<-function(data){
  #plot1
  par(mfrow = c(1, 2))  # One row and two columns
  plot(data$wt, data$mpg, main = "MPG vs. Weight", xlab = "Weight/1,000", ylab = "MPG")
  my.color=c("black","red","green","blue")
  legend("topright",inset=0.07,title = "Quantiles",c("0-25","25-50","50-75","75-100"),cex = 0.5 ,col = my.color,bg="grey90",pch = 19)
  
  mquantile=quantile(data[,"mpg"])
  for(i in 1:length(mquantile)){
  abline(h = mquantile[i], lty = i, col = "gray90")
  }
  style=list()
  for (i in 1:(length(mquantile-1))){
  style[[i]] = data[data$mpg<=mquantile[i+1]&data$mpg>mquantile[i], ]
  points(style[[i]]$wt, style[[i]]$mpg,pch=19,col=my.color[i],bg="white")
  }
  style1=vector()
  style1 = data[data$mpg==mquantile[1], ]
  points(style1$wt, style1$mpg,pch=19,col=my.color[1],bg="white")
  text(4,mquantile, c("0%","25%","50%","75%","100%"),cex=0.6,pos=4) 
  
  #  plot2
  plot(data$wt, data$mpg, main = "MPG vs. Weight", xlab = "Weight/1,000", ylab = "MPG")
  legend("topright",title = "Quantiles",c("0-25","25-50","50-75","75-100"),cex = 0.5 ,col = my.color,bg="grey90",pch = 19)
  squantile=quantile(data[,"wt"])
  for (i in 1:length(squantile)){
  abline(v =squantile[i], lty = i, col = "gray90")
  }
  for (i in 1:(length(squantile)-1)){
  style[[i]] = data[data$wt<=squantile[i+1]&data$wt>squantile[i], ]
  points(style[[i]]$wt, style[[i]]$mpg,pch=19,col=my.color[i],bg="white")
  }
  style1 = data[data$wt==squantile[1], ]
  points(style1$wt, style1$mpg,pch=19,col=my.color[1],bg="white")
  
  stquantile=round(squantile,1)
  mtext(at = stquantile, text = stquantile,side=3)
  
}
my.function(mtcars)


#2a

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
sparrows = read.table(url,header=T)
head(sparrows)
par(mfrow = c(1, 1))
a=unique(sparrows$Observer)
b=length(a)
c=vector()
for(i in 1:b){
  c[i]=length(sparrows$Observer[sparrows$Observer==a[i]])    
}
mycols<-colorRampPalette(c("white", "lightblue"))
boxplot(Wt~ Observer, data = sparrows, main = "Sparrow Weight by Observer",
        col=mycols(7),notch=TRUE, xlab = "Observer Number",ylab="Sparrow Weight")
grid()
mtext(at = 1:b, text =c,col="red" )


#2b

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url,header=T,sep=",")
head(myd)
library(lattice)
xyplot(price ~ carat|factor(color), groups = factor(cut),data = myd, 
       type=c("g","p"),pch = 16, main = "Diamond Price vs carat size",
       auto.key = list(title = "Diamond Quality",corner = c(0.7, 1)),layout=c(3,3))


#3


set.seed(199)
x=rnorm(100,10)
smean=mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
head(sci)
plot.ci<-function(sci,smean){
  library(lattice)
  
  out=vector()
  not=vector()
  y=vector()
  k=1 
  for(i in 1:nrow(sci)){
    if(smean<sci[i,1]|smean>sci[i,2]){
      out[i]=1
      not[k]=i
      k=k+1}
    else{out[i]=0 
    }
    if(i==1){y[i]=0.5}
    else{y[i]=y[i-1]+0.2}
  }
  buffer=(max(sci[,2])-min(sci[,1]))/20
  ylimits=c(round(y[1]-buffer,1),round(y[nrow(sci)]-buffer,1))
  xlimits=c(round(min(sci[,1])-buffer,1),round(max(sci[,2])+buffer,1))  
  plot(xlimits,ylimits,main="Confidence Intervals",type="n",xlab="",ylab="",axes=F)
  for(i in 1:nrow(sci)){
    if(out[i]==1){
      segments(sci[i,1],y[i],sci[i,2],y[i],col="red")
    }else{
      segments(sci[i,1],y[i],sci[i,2],y[i],col="blue")
    }
    
  } 
  axis(1, seq(xlimits[1],xlimits[2],0.2))
  box()
  abline(v=smean)
}

plot.ci(sci, smean) 






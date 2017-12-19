# http://finance.yahoo.com/quote/AAPL/history?period1=1328763600&period2=1486616400&interval=1d&filter=history&frequency=1d

# This function reads in stock data for Apple and MSFT. It will accept dates
# as a range. Based on that it will retireve data from hese data frames
# and display a line plot of both. 

# full range
# 1 day, 5 day, 1 month, 3 month, 1 year, max
# 

mystock <- function(d1,d2) {

  apple <- read.csv("~/Downloads/apple_2014_now.csv",stringsAsFactors = FALSE)
  msft  <- read.csv("~/Downloads/msft_2014_now.csv",stringsAsFactors =  FALSE)
  
  apple$Date <- as.Date(apple$Date,format="%m/%d/%y")
#
  dateread <- function(beg,end,df) {
    begin <- as.Date(d1,format="%m/%d/%y")
    end   <- as.Date(d2,format="%m/%d/%y")
    retdf <- df[df$Date >= begin & df$Date <= end,]
    return(retdf)
  }
#
  plotdf <- dateread(df1,df2,apple) 

  plotdf$months <- factor(months(plotdf$Date),labels=month.abb,ordered=TRUE)
  myt <- tapply(plotdf$Hi,plotdf$months,mean) 
  myt <- aggregate(cbind(High,Low)~months,data=plotdf,mean)
  mymat <- t(myt[-1])
  colnames(mymat) <- myt[,1]
  barplot(mymat,beside=TRUE)

#  plot(1:nrow(july),july$High,type="n",xaxt="n",ylim=c(min(july$Low),max(july$High)))

#  for (ii in 1:nrow(july)) {
#    segments(ii,july[ii,]$Low,ii,july[,]$High)  
#  segments((ii-.5),july[ii,]$Close,(ii+.5),july[,]$Close,lty=3)
#  }

}

data(diamonds)
Sparrows <- read.delim("~/Downloads/RTEMP/steviep42.bitbucket.org/bios545r_2017/DATA.DIR/Sparrows.txt")

plot(Head~Wt,data=Sparrows,pch=19)

sparrowplot <- function(colors=rainbow(4),pch=19) {
  Sparrows <- read.delim("~/Downloads/RTEMP/steviep42.bitbucket.org/bios545r_2017/DATA.DIR/Sparrows.txt")
  par(mfrow=c(1,2))
   main <- "Head vs Wt"
  
  myq <- quantile(Sparrows$Head)
  
  cols <-  cut(Sparrows$Head,
               breaks=myq,
               labels=colors,
               include.lowest=TRUE)
  
  Sparrows$cols <- cols
  mysplit <- split(Sparrows,Sparrows$cols)
  
  plot(Head~Wt,data=Sparrows,type="n",main=main)
  for (ii in 1:length(mysplit)) {
    df <- mysplit[[ii]]
    points(Head~Wt,df,col=as.character(df$cols),pch=pch)
  }
  abline(h=myq,lty=3)
  text(26,myq,c("0%","25%","50%","75%","100%"))
  legend("topleft",c("0-25","25-50","50-75","75-100"),
         title="Quantiles",pch=pch,col=colors, cex=0.7,
         bg = "gray90")
  
  ## Part 2
  
  
  myq <- quantile(Sparrows$Wt)
  
  cols <-  cut(Sparrows$Wt,
               breaks=myq,
               labels=colors,
               include.lowest=TRUE)
  
  Sparrows$cols <- cols
  mysplit <- split(Sparrows,Sparrows$cols)
  
  plot(Head~Wt,data=Sparrows,type="n",main=main)
  for (ii in 1:length(mysplit)) {
    df <- mysplit[[ii]]
    points(Head~Wt,df,col=as.character(df$cols),pch=pch)
  }
  abline(v=myq,lty=3)
  legend(16,38,c("0-25","25-50","50-75","75-100"),title="Quantiles",
         pch=pch,col=colors, cex=0.7,
         bg = "gray90")
  mtext(myq,side=3,at=myq,cex=0.7)
  par(mfrow=c(1,1))
}


sparrowplot(pch=18,colors=rainbow(4))

# This exercise uses epidemiological data. Vicente et al. (2006) analysed 
# data from observations of wild boar and red deer reared on a number of 
# estates in Spain. The dataset contains information on tuberculosis (Tb) 
# in both species, and on the parasite Elaphostrongylus cervi, which only 
# infects red deer.

sapply(Deer,function(x) length(unique(x)))

namz <- unique(Deer$clas1_4,na.rm=T)
namz <- namz[!is.na(namz)]

key <- list(corner=c(1,1),columns=4,
            text=list(as.character(namz)),
            points=list(pch=19),
            col=rainbow(4))

xyplot(LCT~KFI|factor(Year),
       data=Deer,
       col=rainbow(4),
       group=clas1_4,pch=19,
       type=c("p","g"),
       key=key)

#       key = simpleKey(text=as.vector(1:4),corner=c(1,1)))
#       par.settings = simpleTheme(cex=1.5, pch=19))


histogram(~KFI|factor(Year),data=Deer)


myfunc <- function(x) {
  if (!is.numeric(x)) {
    stop("not nmeric")
  }  if (is.numeric(x)) {
    return(x^2)
  }
}
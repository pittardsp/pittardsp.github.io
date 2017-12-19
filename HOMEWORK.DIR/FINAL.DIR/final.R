set.seed(123)
x = rnorm(30,10)

sampvar <- function(x) {
  denom = length(x) - 1
  numer =  sum( (x - mean(x))^2 )
  return(numer/denom)
}
sampvar(x)


sampcov <- function(x,y) {
  numer = sum( (x-mean(x)) * (y-mean(y)) )
  denom = length(x) - 1
  return(numer/denom)
}

set.seed(123)
x = rnorm(1000)

set.seed(456)
y = rnorm(1000)

sampcov(x,y)


mypearson <- function(x,y) {
  numer = sampcov(x,y)
  denom = sqrt(sampvar(x)) * sqrt(sampvar(y))
  return(numer/denom)
}

set.seed(123)
x = rnorm(1000)

set.seed(456)
y = rnorm(1000)


myfunc <- function(xvals,plot=T) {
  retvec = vector()
  for (ii in 1:length(xvals)) {
    if (xvals[ii] <= 0) {
        retvec[ii] = -1*xvals[ii]^3
    } else if ((xvals[ii] > 0) & (xvals[ii] <= 1)) {
        retvec[ii] = xvals[ii]^2
    } else {
        retvec[ii] = sqrt(xvals[ii])
    }   
   }  # End for
  if (plot) {
    plot(xvals,retvec, type="b", main="Piecemeal Function Plot",
         xlab="X-Values",ylab="Y-Values",col="blue",pch=19)
    grid()
  }
  return(retvec)
}

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
myd = read.csv(url)

myplotter <- function(mydf) {
  mydf$color = ifelse(mydf$price < mean(mydf$price),"blue","red")
  plot(mydf$carat,mydf$price,main="Diamon Price vs. Carat Size",
       xlab="Carat Size", ylab="Price",col=mydf$color)
  grid()  
  legend("topleft",c("< mean(price)","> mean(price)"),
          col=c("blue","red"),pch=19)
}
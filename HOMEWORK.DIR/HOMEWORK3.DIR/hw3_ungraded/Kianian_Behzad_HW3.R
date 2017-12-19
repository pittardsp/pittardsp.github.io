# Homework 3
# Behzad Kianian
# http://steviep42.bitbucket.org/bios560rs2014/HOMEWORK.DIR/HOMEWORK3.DIR/

#############
# Problem 1 #
myplot1 <- function() {
  # Set 1 x 2 panel
  par(mfrow=c(1,2))
  # Load mtcars dataset
  data(mtcars)
  
  # Graph 1: Focusing on points by MPG classification
  # MPG factored by quantiles
  mpg.quant <- quantile(mtcars$mpg)
  mpg.group <- cut(mtcars$mpg, breaks=mpg.quant, include.lowest=TRUE)
  # Color pallette: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
  colvec <- c("black", "red", "green", "blue")
  labvec <- c("0-25", "25-50", "50-75", "75-100")
  # Plot
  plot(mtcars$wt, mtcars$mpg, col=colvec[mpg.group], pch=19, 
       xlab="Weight /1,000", ylab="MPG", main="MPG vs Weight")
  # Legend
  legend(3.5, 33, legend=labvec, pch=19,
         col = colvec, bg = "gray91", title = "Quantiles",
         text.width=0.8)
  # Horizontal lines
  abline(h=mpg.quant, lty = 1:5, col = "gray")
  # Text indicating percentile
  text(4.5, mpg.quant, names(mpg.quant))
  
  # Graph 2: Focusing on points by weight classification
  # Weight factored by quantiles
  wt.quant <- quantile(mtcars$wt)
  wt.group <- cut(mtcars$wt, breaks=wt.quant, include.lowest=TRUE)
  plot(mtcars$wt, mtcars$mpg, col=colvec[wt.group], pch=19, 
       xlab="Weight /1,000", ylab="MPG", main="MPG vs Weight")
  abline(v=wt.quant, lty = 1:5, col = "gray")
  legend("topright", legend=labvec, pch=19,
         col = colvec, bg = "gray91", title = "Quantiles",
         text.width=0.8)
  wt.round <- round(wt.quant, digits=1)
  mtext(text=wt.round, side=3, at = wt.quant)
}

myplot1()

##############
# Problem 2A #
myplot2a <- function() {
  url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/Sparrows.txt"
  sparrows = read.table(url,header=T)  
  par(mfrow=c(1,1))
  # Best possible end point: steelblue is best, dodgerblue3 second best.
  # Best starting point: aliceblue
  mycols = colorRampPalette(c("aliceblue", "steelblue"))(8)
  abline(v=unique(sparrows$Observer), lty = 2, col = "gray")
  ourbox <- boxplot(sparrows$Wt ~ sparrows$Observer, notch=TRUE,
          varwidth=TRUE,
          xlab="Observer Number", ylab="Sparrow Weight",
          main="Sparrow Weight by Observer", col=mycols)
  mtext(text=ourbox$n, side=3, at=unique(sparrows$Observer)-1, col="red")
  abline(v=1:7, lty = 2, col = "grey")
  abline(h=seq(16,26,by = 2), lty=2, col="grey")
}

myplot2a()

###############
# Problem 2B #
myplot2b <- function() {
  url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/my.diamonds.csv"
  myd = read.csv(url,header=T,sep=",")
  # dataframe with 1000rows, 10 vars
  library(lattice)
  # Note I am using par.settings to set label cex size and main title cex size
  #       which seems kind of complicated but this is what I could figure out
  xyplot(price~carat | color, data=myd, layout=c(3, 3),
         groups=myd$cut, pch=19, type=c("p", "g"),
         par.settings=list(par.main.text=list(cex = 1.5), par.xlab.text=list(cex=1.2), par.ylab.text=list(cex=1.2)),
         scales=list(cex=1.2),
         auto.key=list(title="Diamond Quality", corner=c(.7,.88), cex=1.2),
         xlab="carat", ylab="price", main="Diamond Price vs. Carat Size")
}

myplot2b()

#############
# Problem 3 #
plot.ci <- function(ci, smean) {
    # Gather the minimum and maximum value for our plot.
    xmin = min(ci)
    xmax = max(ci)
    # Add buffer on left and right. 10% blank space on each side.
    xbuffer = (xmax-xmin)*.1
    # Space between segments equal to a row. 
    # So our ymax is equal to twice number of line segments
    ymax <- 2*nrow(ci)
    plot(x=c(xmin-xbuffer,xmax+xbuffer), y=c(0,ymax), type="n", 
         xlab="", ylab="", yaxt="n", 
         main = "Confidence Intervals", cex.main=1.5, cex.axis=1.35)
    # Determine color using apply and anonymous function
    colors <- apply(ci, 1, function(x) { 
                 if (smean < x[1] || smean > x[2]) {
                    "red";
                 } else "blue"; })
    # Draw line segments. Line width = 2 so they are more visible than default.
    segments(ci[,1], seq(0, ymax, by=2), ci[,2], seq(0, ymax, by=2), 
             lwd=2, col=colors)
    # Vertical line at smean is a bit thicker, and a darker blue.
    abline(v=smean, col="darkslateblue", lwd=3)
    # Return which rows do not contain the mean.
    return(which(colors=="red"))
}

# Example 1
set.seed(199)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci, smean)

# Example 2
set.seed(430)
x = rnorm(100,10)
smean = mean(x)
sci = replicate(100,t.test(sample(x,rep=T))$conf.int)
sci = t(sci)
plot.ci(sci, smean)

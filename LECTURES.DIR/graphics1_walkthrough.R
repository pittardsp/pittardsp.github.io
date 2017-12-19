


# Layout

plot(0:10, 0:10, type="n", xlab="X", ylab="Y", axes=FALSE)

abline(h=seq(0,10,2),lty=3,col="gray90")



abline(v=seq(0,10,2),lty=3,col="gray90")

text(5,5, "Plot Stuff Here", col="red", cex=1.5)

box("plot", col="red", lty = "dotted")

box("inner", col="blue", lty = "dashed")

mtext("South Margin",1,cex=1.2,col="blue")

mtext("West Margin",2,cex=1.2,col="green")

mtext("North Margin",3,cex=1.2,col="orange")

mtext("East Margin",4,cex=1.2,col="purple")

title("An Example Plot")

axis(1)

axis(2)

#

# plot(x,y)    # Traditional way

# Using mtcars:
  
  plot(mtcars$wt, mtcars$mpg, main="MPG vs. Weight")


plot(mtcars$mpg, main="MPG", type="l",xlab="Car Number",ylab="MPG")

plot(mtcars$mpg, main="MPG", type="b",xlab="Car Number",ylab="MPG")

boxplot(mtcars$mpg, main="BoxPlot of MPG",
        ylab="MPG",col="blue",notch=TRUE)

boxplot(mtcars$mpg,main="BoxPlot of MPG",ylab="MPG",col="red")

# Two plots on same page

par(mfrow=c(1,2)) # One row and two columns

plot(mtcars$mpg, main="MPG", type="l",xlab="Car Number",ylab="MPG")

plot(mtcars$mpg, main="MPG", type="b",xlab="Car Number",ylab="MPG")


#

par(mfrow=c(2,2))

plot(mtcars$mpg,main="MPG",xlab="Car",ylab="MPG",type="p")

plot(mtcars$mpg,main="MPG",xlab="Car",ylab="MPG",type="l")

plot(mtcars$mpg,main="MPG",xlab="Car",ylab="MPG",type="h")

plot(mtcars$mpg,main="MPG",xlab="Car",ylab="MPG",type="o")

legend("topleft",legend=c("Test Legend"),cex=0.8)

# Multi panel approach

unique(mtcars$cyl)   # We have three categories so let's create 3 plots


par(mfrow=c(1,3))   # One row and three columns

fourcyl   <- mtcars[mtcars$cyl == 4,]
sixcyl    <- mtcars[mtcars$cyl == 6,]
eightcyl  <- mtcars[mtcars$cyl == 8,] 

plot(fourcyl$wt, fourcyl$mpg, main = "MPG vs Wt 4 Cyl", ylim=c(0,40))
plot(sixcyl$wt, sixcyl$mpg, main = "MPG vs Wt 6 Cyl", ylim=c(0,40))
plot(eightcyl$wt, eightcyl$mpg, main = "MPG vs Wt 8 Cyl", ylim=c(0,40))

par(mfrow=c(1,1)) # Reset the plot window

# automate this approach

par(mfrow=c(1,3))   # One row and three columns
mysplits <- split(mtcars, mtcars$cyl)

for (ii in 1:length(mysplits)) {
  plot(mysplits[[ii]]$wt, mysplits[[ii]]$mpg, 
       ylim <- c(0,40),
       main=paste("MPG vs weight for",names(mysplits[ii])))
}

# Better yet we could make this into a function

cyl.plot <- function(df, fac, numrows=1, numcols=3) {
  par(mfrow=c(numrows,numcols))
  mysplits <- split(df,fac)
  for (ii in 1:length(mysplits)) {
    plot(mysplits[[ii]]$wt, mysplits[[ii]]$mpg,
         ylim = c(0,40),
         main=paste("MPG vs weight for",names(mysplits[ii])))
  }
}
cyl.plot(mtcars,mtcars$cyl)

# annotations

plot(mtcars$wt, mtcars$mpg, xlab = "Weight / 1,000", ylab = "MPG",
     xlim = c(0,10), ylim = c(0,40))

plot(mtcars$wt, mtcars$mpg, xlab = "Weight / 1,000", ylab = "MPG",
     xlim = c(0,10), ylim = c(0,40))


legend("topright", inset=0.05, "My Data", pch=1, col="black")

# Could use specific coordinates also

legend(6.5,35, inset=0.05, "My Data", pch=1, col="black")


# We could also put up our own grid using some "primitive" graphics functions:
  
  plot(mtcars$wt, mtcars$mpg, 
       xlab = "Weight / 1,000",
       main = "MPG vs. WT")

abline(v=c(2,3,4,5),lty=2,col="gray90")  

# Draws vertical dashed lines at 2,3,4,5 

abline(h=c(10,15,20,25,30), lty=2, col="gray90") 

# Horizontal lines at 10,15,20,25,30

# Could do:

abline(v=2:5,lty=2,col="gray90")

abline(h=seq(10,30,5),lty=2,col="gray90")

plot(mtcars$wt, mtcars$mpg,main="MPG vs WT", col="red",
     xlab="Weight in lbs/1,000",
     ylab="Miles per Gallon", 
     pch = 3)


legend("topright", inset=0.05, "My Data", pch = 3, col="red")

grid(col="blue")


# Create a different pch for each level of am

plot(mtcars$wt, mtcars$mpg, type="n", main="MPG vs. Weight")  # A null plot

auto <- mtcars[mtcars$am == 0,]
manu <- mtcars[mtcars$am == 1,]

points(auto$wt, auto$mpg, pch = 0)
points(manu$wt, manu$mpg, pch = 1)

legend("topright", inset=0.05, c("manual","auto"), 
       pch = c(1,0))


# But this would be working too hard. No programming is required. Just 
# recognize that the plot characters are selected by a number from 0  to 25.
# We can exploit this:
  
mtcars$am

# We see that am is 0 or 1 which just so happen to also represent valid print 
# characters

plot(mtcars$wt, mtcars$mpg, pch=mtcars$am, 
     main="MPG vs. Weight", sub="Different plot chars")

legend("topright", inset=0.05, c("manual","auto"), 
       pch = unique(mtcars$am))

# layered plots

plot(mtcars$wt,mtcars$mpg,type="n",xlab="Weight in lbs/1,000",
     ylab="MPG", main="MPG vs. Weight")

plot(mtcars$wt,mtcars$mpg,type="n",xlab="Weight in lbs/1,000",
     ylab="MPG", main="MPG vs. Weight")

# Let's get records for each category

above.mean <- mtcars[mtcars$wt >= mean(mtcars$wt),]

below.mean <- mtcars[mtcars$wt < mean(mtcars$wt),]

# Use the points command to plot each group 

points(below.mean$wt,below.mean$mpg,col="red")

points(above.mean$wt,above.mean$mpg,col="blue")

# Draw a vertical line where the mean(wt) is

abline(v=mean(mtcars$wt),lty=2,col="gray90")

# Unfortunately there is nothing in the existing data set that tells us if 
# a given row's weight value is greater than or below the mean weight. We 
# could handle this a couple of ways - one of which is to use our knowledge 
# of for loops.


colvec <- ifelse(mtcars$wt >= mean(mtcars$wt),"blue","red")

colvec

plot(mtcars$wt,mtcars$mpg,col=colvec)


# We can add text to our plot with no problem.

plot(mtcars$wt, mtcars$mpg, main="Mileage vs. Car Weight",
     xlab="Weight", 
     ylab="Mileage", 
     pch=18, col="blue")


text(mtcars$wt, mtcars$mpg, # Note we cannot use the formula in text
     row.names(mtcars),    # Get the row names
     cex=0.6,              # Scaling of the font size
     pos=4, 		           # 1=below, 2=left, 3=above, 4=right 
     col="red")

# Use the rownames. Filter out just the car manufacturer

plot(mtcars$wt, mtcars$mpg, main="Mileage vs. Car Weight",
     xlab="Weight", 
     ylab="Mileage", 
     pch=18, col="blue")


carlabs <- sapply(strsplit(row.names(mtcars)," "),function(x) x[[1]])

text(mtcars$wt, mtcars$mpg, # Note we cannot use the formula in text
     carlabs,    # Get the row names
     cex=0.6,              # Scaling of the font size
     pos=4, 		           # 1=below, 2=left, 3=above, 4=right 
     col="red")


# Let's look at a more involved annotation example. We'll use the same data:
  
  plot(mtcars$mpg ~ mtcars$wt,cex=0.8,
       pch=21,col="blue",bg="red",
       xlab="Wt in Lbs/1,000",
       ylab="Miles Per Gallon")

title(main="The mtcars data set wt vs. MPG")

# Next draw a vertical line at the mean of the weight

abline(v=mean(mtcars$wt),lty=2,col="blue")

# Next draw a horizontal line at the man of the MPG

abline(h=mean(mtcars$mpg),lty=2,col="blue")

points(mean(mtcars$wt),       # Draws a diamond at the common mean
       mean(mtcars$mpg),
       pch=23,col="black",
       bg="brown",
       cex=2)


# Let's put some custom text on the graph to indicate the mean.

text(mean(mtcars$wt),min(mtcars$mpg),
paste("Mean:",round(mean(mtcars$wt),2)),pos=4)

text(min(mtcars$wt),mean(mtcars$mpg),
paste("Mean:",round(mean(mtcars$mpg),2)),adj=c(0,1))

# Note that this is basically equivalent to:

text(3.2,10.4,paste("Mean:",round(mean(mtcars$wt),2)),pos=4)

text(2,20.09,paste("Mean:",round(mean(mtcars$mpg),2)))

# Drawing your own axis

url <- "https://steviep42.bitbucket.org/bios545r_2017/SUPP.DIR/stock.data.14.csv"

msft <- read.csv(url)

head(msft)

plot(msft$High,type="l",main="High MSFT Price",
     xlab="Day of Year",ylab="Price in $")

mtext("2014",3)

# The day number is okay but we could also the actual dates as labels. But 
# that could be a problem. First, we use the xaxt argument to suppress the printing 
# of the x-axis

plot(msft$High,type="l",main="High MSFT Price",
     xlab="Day of Year",ylab="Price in $", xaxt="n") 

axis(1,at=1:nrow(msft),labels=msft$Date)

# That wasn't so good because the X-axis got really crowded. We can print 
# labels for the x-axis every 30 days or so using this approach. 

# We could alter this to accommodate an arbitrary number of days and labels. 

# Notice how we generate  sequence that we then use to index into the Dates.

plot(msft$High,type="l",main="High MSFT Price",
xlab="Day of Year",ylab="Price in $", xaxt="n")
mtext("2014",3)

dseq <- seq(1,nrow(msft),30)

axislabs <- substr(msft$Date[dseq],6,10)

axis(1, at=dseq, labels=axislabs, cex.axis=0.8)


# Colors
# See http://research.stowers-institute.org/efg/R/Color/Chart/ColorChart.pdf

length(colors())  # The colors function returns a vector of colors

colors()[1:5]

grep("yellow",colors(),value=TRUE)

grep("purple",colors(),value=TRUE)


# barplots

# If we have some categories we want to look at we can easily visualize it. 
# Barplots are for plotting tables. Let's count up all the cars by cylinder 
# type from mtcars:

table(mtcars$cyl)

barplot(table(mtcars$cyl), axes=T, main = "Cylinder Barplot")

table(mtcars$cyl)

barplot(table(mtcars$cyl), axes=T, 
        main = "Cylinder Barplot", col=heat.colors(3))

table(mtcars$cyl,mtcars$am)   # A bigger table

barplot(table(mtcars$cyl,mtcars$am), legend = T, beside = T, 
              col=heat.colors(3), main='Cylinder Count by Transmission Type')

barplot(table(mtcars$cyl,mtcars$am),legend = T, 
        beside = F, col=heat.colors(3),
        main='Cylinder Count by Transmission Type',ylim=c(0,25))

barplot(table(mtcars$cyl,mtcars$am),legend = T, 
        beside = F, col=heat.colors(3),
        main='Cylinder Count by Transmission Type',
        xlim=c(0,25),horiz=T)

# Using colors instead of print characters

mycols <- rainbow(2)

mycols


# Remember that the transmission types are indicated by a 0 (auto) or
# 1 (manual). We need to take this into account when indexing into the 
# mycols vector.

plot(mtcars$wt, mtcars$mpg, col = mycols[mtcars$am+1], pch=19)

legend("topright",c("Auto","Manual"),col=mycols,pch=19)

## Animation

x <- runif(1000000,-3,3) # Get one million vals from a uniform distro

myhist <- function(pop,timestosamp, numtosamp, sleep=0.25) {
  
  avgvec <- vector()
  length(avgvec) <- timestosamp
  
  for (ii in 1:timestosamp) {
    avgvec <- c(avgvec,mean(sample(pop,numtosamp)))
    hist(avgvec,main=paste("Histogram - Iteration #",ii,sep=" "),
         xlim=c(-3,3))
    Sys.sleep(sleep)
  }
}

myhist(x,500,5,sleep=.10)

# Indometh

head(Indometh)

unique(Indometh$Subject) 

plot.indometh <- function(mydf, rows=3, cols=2) {
  
  my.length <- length(levels(Indometh$Subject))
  
  par(mfrow=c(rows,cols))        # Plot Layout
  
  col = rainbow(my.length)       # Get some colors
  
  for (ii in 1:my.length) {
    x.label <- paste("Subject",ii,"Time (hours)",sep="_")
    temp <- subset(mydf,Subject==ii)
    
    plot(temp$conc ~ temp$time,
         main="Pharmacokinetics of Indomethicin",
         xlab=x.label,
         ylab="Conc (mcg/ml)",type="l",
         col=col[ii])      
  }
}

plot.indometh(Indometh)
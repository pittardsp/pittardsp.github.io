# SLIDE 14

getOption("defaultPackages")
  
search()

library(help="stats")

# SLIDE 16

search()
 
data(package="stats")

# SLIDE 18

install.packages("actuar",dependencies=TRUE)

library(actuar)   # Brings the package into the workspace

search()   # Now see the package actuar is present

# SLIDE 20

install.packages("GeoIP", repos = "http://www.omegahat.org/R")

# SLIDE 30

help.start()

# SLIDE 31

help(function_name)  # Get help on function

?function_name       # Equivalent to the above
args(function_name)  # See what arguments the function accepts
example(function_name)  # See an example
?mean
example(mean)


# SLIDE 32

help.search("time series")

??"time series"

# SLIDE 33

RSiteSearch("correlation")

# SLIDE 37

url <- "http://steviep42.bitbucket.org/bios545r/DATA.DIR/table_7_3.csv" 
engine <- read.table(url, sep = ",", header=TRUE)

engine<-engine[,-1]

head(engine)         # 3 engine pollutants
    
summary(engine)  # Check the third column

# SLIDE 38

boxplot(engine)   # Carbon Monoxide

# SLIDE 39

par(mfrow=c(1,3))

boxplot(engine$co,main="Carbon Monoxide")

hist(engine$co)

qqnorm(engine$co,main="Carbon Monoxide")

qqline(engine$co)

# SLIDE 41 

# Null hypothesis is that the data is normal
 
shapiro.test(engine$co)

	
# Take the log of the CO
 
log.engine <- log(engine$co)
 
shapiro.test(log.engine)

# SLIDE 42 

par(mfrow=c(2,2))

log.engine <- log(engine$co)

boxplot(log.engine,main="Carbon Monoxide")

hist(log.engine,main="Carbon Monoxide")

qqnorm(log.engine,main="QQ Plot for the Log of the Carbon Monoxide")

qqline(log.engine)

# SLIDE 44

# Let's build a confidence interval

my.mean <- mean(log.engine)

my.sd <- sd(log.engine)

n <- length(log.engine)

# Get standard error

se <- my.sd/sqrt(n)

error <- se*qt(0.975,df=n-1)

left <- my.mean - error

right <- my.mean + error

c(left,right)

c(exp(left),exp(right))

# SLIDE 45

# Test H0: mu  = 5.4 
#      HA:mu  != 5.4 

lNull <- log(5.4) - error

rNull <- log(5.4) + error

c(lNull,rNull)

my.mean

#So the mean is outside the range so we reject the null hypothesis. There #is a low probability that we would have obtained our sample mean if the #true mean really were 5.4.

# SLIDE 46

# We could have calculated a p-value by hand

p.val <- 2*(1-pt((my.mean-log(5.4))/se,df=n-1))

p.val

# But its easier to call a procedure to do it all

t.test(log.engine,mu = log(5.4),alternative = "two.sided")

# SLIDE 48

?mean			     # Get help on the mean function

example(kmeans)	 # Run an example of kmeans (if it exists)

pi			    # Some popular quantities are built-in to R

sqrt(2)			# Basic arithmetic

print(pi)		# Print the comments of the pi variable
 
X <- 3; Y <- 4 	# Semicolon lets you enter 2 commands on the same line

Z <- sqrt(X^2 + Y^2)	# Variables contain information

ls()			# List all variables in the “environment”


# SLIDE 49


2+3

3/2

2^3

(56 - 14) / 6 - 4 * 7 * 10 / (5^2 - 5)

abs(2-4)

cos(4*pi)

factorial(6)

choose(32,4)

x <- c(1,2,3,4)

y <- c(5,6,7,8)

x * y

y/x
       
cos(x * pi) + cos(y * pi)

# SLIDE 50 

log(10)
 
log10(100)
 
1.3e6

9 %% 2

8 %% 2
 
floor(5.7)

ceiling(6.8)

round(6.889,2)
 
3/0

0/0

is.finite(3)

x <- c(1:8,NA)

mean(x)

mean(x,na.rm=T)

# SLIDE 52 

# a^2 + b^2 = c^2		      # Pythagorean Theorem

a <- 2; b <- 4

c <- sqrt(a^2 + b^2) 	      # To solve the PT for c

a <- 2; b <- 4; c <- 1

# First case quadratic formula solution

(-b + sqrt(b^2 - 4*a*c)) / 2*a      

# Second case quadratic formula solution

(-b - sort(b^2 - 4*a*c)) / 2*a      

r <- 4; h <- 6; b <- 3

circumference <- 2*pi*r 	      # circumference of a circle 

area <- (b*h)/2		           # Area of a triangle

# SLIDE 53 

area <- expression( (b*h)/2 )

# Solve where b = 3 and h = 4

b <- 3

h <- 4

eval(area)

area <- function(b,h) {   # b and h are arguments / placeholders
    my.area <- (b*h)/2 
    return(my.area)      
}

area(3,4)

# SLIDE 54

r1 <- expression((-b + sqrt(b^2 - 4*a*c)) / 2*a)

r2 <- expression((-b - sqrt(b^2 - 4*a*c)) / 2*a)

# Solve for ax^2 + bx + c where a = 1, b=6, and c=8

a <- 1 ; b<-6 ; c<-8

eval(r1)

eval(r2)

a*eval(r1)^2 + b*eval(r1) + c

a*eval(r2)^2 + b*eval(r2) + c

# SLIDE 55

my.quad <- function(a,b,c) {
       r1 <- (-b + sqrt(b^2 - 4*a*c)) / 2*a
       r2 <- (-b - sqrt(b^2 - 4*a*c)) / 2*a
       my.roots <- c(r1,r2)
       return(my.roots)
}


# Solve for ax^2 + bx + c where a = 1, b=6, and c=8

> my.quad(1,6,8)
[1] -2 -4

# SLIDE 57

# Things you might want to change

options(editor="notepad") 
cd <- setwd
pwd <- getwd
lss <- dir

# R interactive prompt 
options(prompt="> ")
options(continue="+ ") 

# General options 
options(digits=3) 
options(width = 130)
options(graphics.record=TRUE) 

.First <- function(){
 library(Hmisc)
 cat("\nWelcome at", date(), "\n") 
}

.Last <- function(){ 
 cat("\nGoodbye at ", date(), "\n")
}

# SLIDE 58

getwd()

setwd("/Users/fender")

getwd()

setwd("/Users/fender/TEST.DIR")

getwd()

dir()
 
# SLIDE 59

system("ls -1")


# SLIDE 61

save(list = ls(all=TRUE), file = "/Users/myhome/.MyRdata")

my.lm <- lm(mpg ~ wt,mtcars)

ls(my.lm)
     
save(my.lm,file="/Users/myhome/.MyLM")

load("/Users/myhome/.MyLM")

# SLIDE 63

ls() # Check to see what objects there are in memory

source("stuff.R",echo=TRUE)

f <- function(x) x + y

g <- function(x) x - y 

ls() # Ah, we now have two functions in the workspace.

# SLIDE 64

ls() # Ah, we no have two functions in the workspace.

rm("g")

ls()

rm(list = ls())

# SLIDE 64 

help.start()

# SLIDE 65

X <- 2.5  # These two statements are equivalent

X <- 2.5   # Same as above

X

mynewvar <- X + 3

MYNEWVAR <- X + 3 # Two different variables



# SLIDE 66

help.search(“time series”)  

??"time series"

# SLIDE 68 

head(mtcars)

write.table(mtcars,file="mtcars.csv", 
              row.names=TRUE,           # Row names get saved
              col.names=TRUE,           # Header gets saved
              sep=",")

# SLIDE 69

set.seed(123)

x <- rnorm(10)

y <- rnorm(10)

print(x)

cat ("y =", y, "\n")

t.test(x,y)

plot(x,y)

# SLIDE 70

x <- rnorm(10)

y <- rnorm(10)

print(x)

cat ("y =", y, "\n")

y = 1.224082 0.3598138 0.4007715 0.1106827 -­‐0.5558411 1.786913 0.4978505 -­‐1.966617
0.7013559 -­‐0.4727914

t.test(x,y)

# SLIDE 71

sink("my.results.txt") # All output will now go to "my.results.txt"

set.seed(123)

x <- rnorm(10)

y <- rnorm(10)

print(x)

cat ("y =", y, "\n")

t.test(x,y)

plot(x,y)

sink() # This will turn off the sink

# SLIDE 73

set.seed(123)

x <-rnorm(10)

y <-rnorm(10)

print(x)

cat ("y =", y, "\n")

t.test(x,y)

plot(x,y)


# SLIDE 74

set.seed(123)

x <-rnorm(10)

y <-rnorm(10)

print(x)

cat ("y =", y, "\n")

t.test(x,y)

pdf("myplots.pdf")   # Redirects plots to myplots.pdf

plot(x,y)

dev.off() 

# SLIDE 75

url <- "http://steviep42.bitbucket.org/bios545r/DATA.DIR/hsb2.csv"

my.input <- read.table(url,header=T,sep=",")

head(my.input)

# SLIDE 77

library(XML)

url <- "http://msenux.redwoods.edu/math/R/regression.php"

my.table <- readHTMLTable(url,which=1)

my.table <- my.table[-1:-2,]

names(my.table) <- c("Age","Height")

head(my.table)

# SLIDE 79

url <- "http://en.wikipedia.org/wiki/World_population"
 
table.four <- readHTMLTable(url, which=4) # Most densely populated countries

table.four

# SLIDE 80

table.four <- table.four[,-4:-6]  # Eliminate the 4th-6th column

# Get rid of the commas in the numbers

table.four$Population<-as.numeric(gsub(",","",table.four$Population))/100000 

# Give the columns new names

names(table.four) <- c("Rank","Country","Population")

# Plot the data
library(lattice)

xyplot(Population ~ Country,table.four,scales = list(x = c(rot=60)),
       type="h",main="Most Populated Countries")

# SLIDE 86

m <- dbDriver("SQLite")
    
    # initialize a new database to a tempfile and copy some data.frame
    # from the base package into it

tfile <- tempfile()

con <- dbConnect(m, dbname = tfile)

data(USArrests)

dbWriteTable(con, "USArrests", USArrests)

rs <- dbSendQuery(con, "select * from USArrests")

d1 <- fetch(rs, n = 10)      # extract data in chunks of 10 rows

# SLIDE 87

dbClearResult(rs)

rs <- dbSendQuery(con, "select * from USArrests where 
                                 Assault > 10 order by Murder")
d1 <- fetch(rs, n = 10)
d1

# SLIDE 88

install.packages("sqldf", dependencies = TRUE)

library(sqldf)

data(mtcars)

sqldf("select * from mtcars where mpg > 20 AND cyl == 4")

# SLIDE 90 

library(RCurl)
library(XML)

my.url <- "http://maps.googleapis.com/maps/api/geocode/xml?address=Atlanta,GA&sensor=false"

txt <- getURL(my.url)

hold <- xmlTreeParse(txt,useInternalNodes=TRUE)

place <- getNodeSet(hold,"//GeocodeResponse/result[1]/geometry/location[1]/*")

as.numeric(sapply(place,xmlValue))


# SLIDE 92

my.url <- "http://api.wunderground.com/auto/wui/geo/GeoLookupXML/index.xml?query=33.749,-84.38798"

myweather <- getURL(url)

hold <- xmlTreeParse(myweather, useInternalNodes=TRUE)

qstr <- "//location/nearby_weather_stations/pws/station[distance_mi<5]/ancestor-or-self::station/id"

stationsXml <- getNodeSet(hold,qstr)

stations <- sapply(stationsXml,xmlValue)

stations


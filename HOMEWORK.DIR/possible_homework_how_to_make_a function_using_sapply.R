set.seed(123)
x <- as.integer(rnorm(500000,80,10))

moving <- function(x,window=5) {
  
  retvec <- vector()
  ctr <- 1
  
  idx <- seq(1,length(x),window)
  for (ii in idx) {
    retvec[ctr] <- mean(x[ii:(ii+(window-1))])
    ctr <- ctr + 1
  }
  return(retvec)
}


moving <- function(x,window=5) {
  
  retvec <- vector()
  ctr <- 1
  
  idx <- seq(1,length(x),window)
  for (ii in idx) {
    retvec[ctr] <- mean(x[ii:(ii+(window-1))])
    ctr <- ctr + 1
  }
  return(retvec)
}

#

set.seed(123)
nums <- round(runif(15,1,30),0)
window <- 5

myw <- function(nums,window=5) {
 retvec <- vector()
 myl <- length(nums)
 for (ii in 1:(myl-window+1)) {
   retvec[ii] <- mean(nums[ii:(ii+(window-1))])
 }
 return(retvec)
}

# We can replace the for loop with a little work. We simply make a function
# that computes the mean of a given window for a single iteration and then
# use sapply

myf <- function(idx) {
  return(mean(xvec[idx:(idx+9)]))
}

sapply(seq(1,length(xvec),10),myf)


# 
# Generate confidence intervals for a mean
#

# a <- 5 # mean
# s <- 2 # sd 
# n <- 20 # num of samples

# error <- qnorm(0.975)*s/sqrt(n)
# left <- a-error
# right <- a+error
# c(left,right)

set.seed(123)
x <- rnorm(1000,50,5)

# Create a 10 column matrix with 20 rows (samples) each

set.seed(123)
sampmat <- replicate(100,sample(x,100,T))

# Get the means of each column

means <- apply(sampmat,2,mean)

# Get the mean and sd of the means

momeans <- mean(means)
sdomeans <- sd(means)
n <- 100

left <- momeans - (qnorm(0.975)*sdomeans/sqrt(n))
right <- momeans + (qnorm(0.975)*sdomeans/sqrt(n))

c(left,right)
t.test(x,mu=50)

#
# Rmisc
#
library(Rmisc)
CI(x,ci=0.95)

#
# DescTools for mean by bootstrap
#
library(DescTools)
MeanCI(x,method="boot",type="norm",R=1000)

#
# Lock5Data
#
library(Lock5Data)
data(CommuteAtlanta)

mean(ca$Time)
#

bootmat <- replicate(1000,sample(ca$Time,500,T))

boot.stats <- apply(bootmat,2,mean)

meanboot <- mean(boot.stats)
sdboot <- sd(boot.stats)
#

left <- meanboot - (qnorm(0.975)*sdboot)
right <- meanboot + (qnorm(0.975)*sdboot)
c(left,right)

round(c(left,right),1)

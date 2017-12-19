####### some simulation examples

################################
## I. central limit theorem
################################

###### exponential distribution
X0=rexp(100000, rate=2)
## small sample
n=5
X=matrix(X0, ncol=n)
y=rowMeans(X)
par(mfrow=c(1,2))
hist(y)
qqnorm(y); qqline(y)

## increase sample size
n=100
X=matrix(X0, ncol=n)
y=rowMeans(X)
par(mfrow=c(1,2))
hist(y)
qqnorm(y); qqline(y)

## with 100 samples, exponetial distribution converges to normal.

######## Poisson distribution
X0=rpois(10000, lambda=10)
n=5
X=matrix(X0, ncol=n)
y=rowMeans(X)
mypar(mfrow=c(1,2))
hist(y)
qqnorm(y); qqline(y)

## For Poisson distribution, CLT works fine even for 5 samples

###########################################
## II. type I error of one sample t-test
###########################################

nsims=10000
pvals=rep(0, nsims)
for(i in 1:nsims) {
  x = rnorm(100)
  pvals[i] = t.test(x)$p.value
}
mean(pvals<0.05)

hist(pvals)

################################
## III. linear regression
################################
## a function for simulating data
simData=function(b0, b1, X){
  eps=rnorm(n, mean=0, sd=1)
  b0+b1*X+eps
}

## a function for estimating b1
estB1=function(X, Y) {
  a=X-mean(X)
  b=Y-mean(Y)
  sum(a*b)/sum(a^2)
}

## set constants: 1000 simulations, 100 samples, b0 and b1
nsims=1000
n=100
b0=5; b1=0.5

## generate and fix X
X=rnorm(n, mean=5, sd=2)
b1.hat=numeric(1000)
for(isim in 1:nsims) {
  y=simData(b0, b1, X=X)
  b1.hat[isim]=estB1(X, y)
}

## compare observed and theoretical values
mean(b1.hat - b1) ## bias of the estimated b1

var(b1.hat)  ## empirical variance of the estimated b1.
1/sum((X-mean(X))^2) ## theoretical variance of the estimated b1.

hist(b1.hat) ## follow a normal distribution
qqnorm(b1.hat)
qqline(b1.hat)


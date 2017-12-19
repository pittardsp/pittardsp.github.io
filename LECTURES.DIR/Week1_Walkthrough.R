
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/table_7_3.csv"

engine <- read.table(url, sep = ",", header=TRUE)
engine <- engine[,-1]

head(engine) # 3 engine pollutants

summary(engine)

boxplot(engine,col="red",main="Engine Pollutants")

par(mfrow=c(1,3))
boxplot(engine$co,main="Carbon Monoxide")

hist(engine$co)

qqnorm(engine$co,main="Carbon Monoxide")
qqline(engine$co)

# The null hypothesis is that the data is normal
shapiro.test(engine$co)

log.engine <- log(engine$co)
shapiro.test(log.engine)

par(mfrow=c(2,2))
log.engine <- log(engine$co)
boxplot(log.engine,main="Carbon Monoxide")
hist(log.engine,main="Carbon Monoxide")
qqnorm(log.engine,main="QQ Plot for the Log of the
Carbon Monoxide")
qqline(log.engine)


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

# Test H0: mu = 5.4
# HA:mu != 5.4
lNull <- log(5.4) - error
rNull <- log(5.4) + error
c(lNull,rNull)


my.mean


p.val <- 2*(1-pt((my.mean-log(5.4))/se,df=n-1))
p.val

t.test(log.engine,mu = log(5.4),alternative = "two.sided")
###### sample script for data analysis
head(mtcars)
dim(mtcars)

#### look at distribution of data
## categorical data
table(mtcars$cyl)
table(mtcars$vs)
table(mtcars$am)
table(mtcars$gear)
table(mtcars$carb)

##pdf("mtcars_hist.pdf", width=6, height=4)
## continuous data
par(mar = c(2.5, 2.5, 1.6, 1.1), mgp = c(1.5, 0.5, 0),
    mfrow = c(2,2))
hist(mtcars$mpg)
hist(mtcars$disp)
hist(mtcars$hp)
hist(mtcars$wt)
## graphics.off()

##### look at correlations in data
table(mtcars$am, mtcars$cyl)
table(mtcars$am, mtcars$gear)

cor(mtcars[,c("mpg", "disp", "hp", "wt", "qsec")])
##pdf("mtcars_pairs.pdf")
pairs(mtcars[,c("mpg", "disp", "hp", "wt", "qsec")])
##graphics.off()


### answer questions

## Do cars with automatic and manual transmission have different fuel consumption?
res = t.test(mtcars$mpg ~ mtcars$am)


## Do cars with different number of cylinders have different fuel consumption
res = aov(mtcars$mpg ~ mtcars$cyl)
res
summary(res)

## What are the important factors for fuel consumption
fit = lm(mtcars$mpg ~ mtcars$wt)
summary(fit)

pvals=rep(0, 10)
for(i in 2:11) {
  fit = lm(mtcars$mpg ~ mtcars[,i])
  s=summary(fit)
  pvals[i-1]=s$coefficients[2,4]
}
names(pvals) = colnames(mtcars)[2:11]
pvals

### build a joint model
fit = lm(mtcars$mpg ~ mtcars$wt + mtcars$cyl)
summary(fit)
coef(fit)
confint(fit)

## plot final model
##pdf("fit_plot.pdf", width=5, height=4)
par(mar = c(2.5, 2.5, 1.6, 1.1), mgp = c(1.5, 0.5, 0), mfrow = c(2,2))
plot(fit)
##graphics.off()

### build non-linear model between mpg and hp
fit=lm(mpg~hp, data=mtcars)
fit.lowess=lowess(mtcars$hp, mtcars$mpg)
fit.loess=loess(mpg~hp, data=mtcars)
fit.spline=smooth.spline(mtcars$hp, mtcars$mpg,df=3)

##pdf("smoothing.pdf", width=5, height=4)
##mypar(1,1)
plot(mpg~hp, data=mtcars, main = "mtcars", pch=19, col="#00000080")
abline(coef(fit), lwd=2, lty=2)
lines(fit.lowess, lwd=2, lty=1)
ix=sort(fit.loess$x, index=TRUE)$ix
lines(fit.loess$x[ix], fit.loess$fitted[ix], col=2, lwd=2, lty=1)
lines(fit.spline, col=3, lwd=2, lty=1)
legend("topright", legend=c("lm", "lowess", "loess", "smooth.spline"), lwd=2,
       col=c(1,1:3), lty=c(2,1,1,1))
##graphics.off()


##### test on contingency table
tbl = table(mtcars$am, mtcars$cyl)
tbl
chisq.test(tbl)
fisher.test(tbl)


#### clustering
##pdf("kmeans.pdf", width=5, height=4)
res.kmeans=kmeans(mtcars, 3)
plot(mpg~hp, data=mtcars, pch=19, type="n")
idx=split(1:nrow(mtcars), res.kmeans$cluster)
for(i in 1:length(idx))
    points(mtcars$hp[idx[[i]]], mtcars$mpg[idx[[i]]], col=i, pch=19)
##graphics.off()

##pdf("hclust.pdf", width=8, height=4)
##mypar(1,1)
dd=dist(mtcars)
hc=hclust(dd)
plot(hc, xlab="")
##graphics.off()

  

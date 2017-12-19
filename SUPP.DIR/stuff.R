data(mtcars)
mpg.avg = mean(mtcars$mpg)
my.lm = lm(mpg~wt,data=mtcars)
wt.avg = mean(mtcars$wt)

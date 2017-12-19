dotplot(~mpg,data=mtcars,groups=factor(cyl),auto.key=T,type=c("p","g"))


wdays = getWeatherForDate("ATL","2014-02-01","2014-02-7")

table(format(wdays$Time,'%A'))

day1 = wdays[wdays$Time > as.POSIXlt("2014-02-01 00:52:00 EST") & wdays$Time < as.POSIXlt("2014-02-02 00:00:00 EST"),]

newdays = cbind(wdays,day=(format(wdays$Time,'%A')))

newdays = cbind(newdays,pressure=runif(235,28.00,30.20))

summ = tapply(newdays$TemperatureF,newdays$day,mean)

plot(summ,type="b")
mean(newdays$TemperatureF)
abline(h=46.332)

dotplot(~TemperatureF|factor(day),newdays,layout=c(1,7))


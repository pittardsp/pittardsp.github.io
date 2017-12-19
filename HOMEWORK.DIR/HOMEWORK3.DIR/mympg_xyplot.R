mympg <- function(layout=c(2,5),pch=19) {
  library(lattice)
  if (prod(layout) != 10) {
   stop("Sorry - the layout numbers must be integers and their product must equal 10")
  }
  xyplot(hwy~cty|factor(trans),data=mpg,
         groups=drv,
         par.settings=list(superpose.symbol=list(pch=pch),
                           auto.key=T),
         layout=layout,
         auto.key=list(columns=3,title="Drive Type"),
         main="Hwy MPG vs City",type=c("p","g"))

}
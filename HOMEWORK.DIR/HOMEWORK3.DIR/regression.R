# Write a function that given two variables from a data frame will
# create a linear model and issue the following plots


mylmer <- function(x,y) {
  mylm <- lm(y~x)
  
  par(mfrow=c(1,3))
  plot(x,y,col="green",type="n",main="X vs. Y")

  points(x,y,col="blue",pch=19)
  points(x,mylm$fitted.values,col="gray",type="l")
  segments(x,y,x,mylm$fitted.values,lty=2,col="black")
  grid()
  
  #
  
  qqnorm(scale(mylm$residuals),pch=19,col="blue")
  qqline(scale(mylm$residuals))
  
  #
  
  plot(mylm$fitted,scale(mylm$residuals),
       main="Scaled Residuals vs. \n Fitted Values",
       pch=19,col="red")
  grid()
  par(mfrow=c(1,1))
  
  return(mylm)
}



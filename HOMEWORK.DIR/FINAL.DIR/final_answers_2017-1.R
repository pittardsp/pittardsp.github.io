# BIOS545R 2017 FINAL ANSWERS

sampvar <- function(somevec) {
  if (!is.numeric(somevec)) {
    stop("The input vector is not numeric")
  }
  if (length(somevec) < 2) {
    stop("The input vector is less than 2 elements")
  }
  retval <- sum((somevec-mean(somevec))^2)/(length(somevec)-1)
  return(retval)
}

sampcov <- function(v1,v2) {
   
    if (!is.numeric(v1) | !is.numeric(v2)) {
      stop("One or both input vectors is not numeric")
    }
    if ((length(v1) <2) | (length(v2) <2)) {
      stop("The length of one or both of the input vectors is less than 2 ")
    }
    if (length(v1) != length(v2)) {
      stop("The length of both vectors must be the same")
    }
    
    scov <- sum((v1-mean(v1)) * (v2-mean(v2))) / (length(v1)-1)
    return(scov)
}

mypearson <- function(v1,v2) {
   
  if (!is.numeric(v1) | !is.numeric(v2)) {
    stop("One or both input vectors is not numeric")
  }
  if ((length(v1) <2) | (length(v2) <2)) {
    stop("The length of one or both of the input vectors is less than 2 ")
  }
  if (length(v1) != length(v2)) {
    stop("The length of both vectors must be the same")
  }
  
  retr <- sampcov(v1,v2)/(sqrt(sampvar(v1))*sqrt(sampvar(v2)))
  return(retr)
}


url <- "https://steviep42.bitbucket.org/bios545r_2017/DATA.DIR/my.diamonds.csv"
myd = read.csv(url)

myplotter <- function(mydf=myd,pch=18) {
  
  abe <- ifelse(mydf$price >= mean(mydf$price),"red","blue")
  plot(price~carat,data=mydf,
       xlab="Carat Size",
       ylab="Price ($)",
       main="Diamond Price vs. Carat Size",
       col=abe,pch=pch)
  grid()
  legend("topleft",
         pch=pch,
         c("<   mean(price)",">= mean(price)"),
         col=c("blue","red"))
}

window <- function(nums,interval=5) {
  retvec <- vector()
  myl <- length(nums)
  for (ii in 1:(myl-interval+1)) {
    retvec[ii] <- mean(nums[ii:(ii+(interval-1))])
  }
  return(retvec)
}
# In Data Mining it is common to take a data set/frame and divide it into a training
# data set and a test dataset. Write a function that takes as arguments a dataframe
# and two numeric arugments that each represent the percentage of the dataframe to return.
# It is common for the training set to be 80% of the records and the test data to be 20%.

mysampler <- function(df,p1,p2) {
  nrows <- nrow(df)
  train <- sample(nrows,nrows*p1,F)
  test  <- mtcars[-train,]
  retlist <- list(train=df[train,],test=test)
  return(retlist)
}


mymean <- function(x,type="arithmetic") {
  if (type == "arithmetic") {
      retval <- sum(x)/length(x)
  } else if (type == "harmonic") {
      retval <- length(x)/sum(x^-1)
  } else {
      retval <- (prod(x))^1/length(x)
  }
  return(retval)
}

mywinsor <- function(x,alpha=0.5) {
  
  upper <- quantile(x, 1 - alpha/2)
  lower <- quantile(x, alpha/2)
  
  x[x >= upper] <- upper
  x[x <= lower] <- lower
  mean(x)
}


blackjack <- function(x) {
 deck <- paste(rep(c(2:10,"J","Q","K","A"),4),c("Clubs","Hearts","Spades","Diamonds"),sep="_")
}

num <- 156

quotient <- num/2*
while ( quotient > 0 ) {
  

x <- c(1,0,0,1,1,0,1,1)

x <- c(1,1,0,1,1,0,0,1)

for (ii in 1:length(x) ) {
  print( x[ii]*2^(ii-1) )
}

num <- 10011011

# Given a binary number - 1001101
# Convert it to an expanded character vector - "1","0","0","1","1","0","1"
# Reverse it 
# From 1 to the length of the character vector

b2d <- function(x) {
  myvec <- vector()
  tmp <- as.character(x)
  str <- unlist(strsplit(tmp,""))
  str <- (rev(str))
  
  for (ii in 1:length(str)) {
    myvec[ii] <- as.numeric(str[ii])*2^(ii-1)
  }
  return(sum(myvec))
}



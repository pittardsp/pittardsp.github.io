download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

# Qeuestion 1
sort(  sapply( split(pres.data,pres.data$cand_nm), function(x) sum(x$contb_receipt_amt) )  )

# Question 2
biggest.donors <- function(candidate.name, x=3){
  if ( (!is.character(candidate.name)) & (x !=round(x)) ){
    stop("candidate.name is not a character. And x is not a integer")
  }
  if (!is.character(candidate.name)){
    stop("candidiate.name is not a character")
  }
  if ( x !=round(x)){
    stop("x is not a integer")
  }
  splitdata <- split(pres.data,pres.data$cand_nm)
  candidate <- splitdata[[candidate.name]]
  order.amt.frombiggest <- rev(order(candidate$contb_receipt_amt))
  candidate2<- candidate[order.amt.frombiggest,]
  choose.cand <- as.data.frame(candidate2[1:x,])
  return(choose.cand)
}
# check the function
biggest.donors(candidate.name ="Trump, Donald J.",x=2 )


# Question 3
simu.dna <- function(long=20,sam.prob=c(0.25,0.25,0.25,0.25)){
  dna <- c("C","A","G","T")
  if ( (long<=0) & (sum(sam.prob) !=1) & ( !all( (sam.prob>=0) & (sam.prob<=1) ) ) ){
    stop("long is not positive.sum of sampling probabilities is not 1.not all of sampling probabilties are between 0 and 1.")
  }
  if ((long<=0) & (sum(sam.prob) !=1)){
    stop("long is not positive.sum of sampling probabilities is not 1")
  }
  if ((sum(sam.prob) !=1) & ( !all( (sam.prob>=0) & (sam.prob<=1) ) )){
    stop("sum of sampling probabilities is not 1.not all of sampling probabilities are between 0 and 1.")
  }
  if ((long<=0) & ( !all( (sam.prob>=0) & (sam.prob<=1) ) )){
    stop("long is not positive. not all of sampling probabilities are between 0 and 1.")
  }
  if ( long<=0 ){
    stop("Long should be positive")
  }
  for ( ii in 1:length(sam.prob) ){
    if ( sam.prob[ii]>1 | sam.prob[ii]<0){
      stop("sample probability should between 0 and 1")
    }
  }
  if ( sum(sam.prob) !=1 ){
    stop("Sum of sample probability should equal to 1")
  }
  sep.dna <-sample(dna,long,replace=TRUE,prob=sam.prob)
  compr.dna <- paste(sep.dna, collapse="")
  samp.freq <- prop.table(table(sep.dna))
  dna.list <- list(dna.sequence.compressed=compr.dna, dna.sequence.separated=sep.dna, sampling.probabilities=sam.prob, observed.frequencies=samp.freq)
  
  return(dna.list)
}
# check the function
simu.dna()
simu.dna(10,sam.prob=c(0.1,0.4,0.3,0.2))

# Question 4
prop_matrix <- function(somematrix,margin=1){
  retmat <- matrix(0,nrow = nrow(somematrix),ncol = ncol(somematrix))
  if (margin==1){
    a <- rowSums(somematrix)
    for ( ii in 1:nrow(somematrix)){
      for ( jj in 1:ncol(somematrix)){
        retmat[ii,jj] <- (somematrix[ii,jj])/(a[ii])
      }
    }
  }
  
  if (margin==2){
    b <- colSums(somematrix)
    for ( ii in 1:ncol(somematrix)){
      for ( jj in 1:nrow(somematrix)){
        retmat[jj,ii] <- (somematrix[jj,ii])/(b[ii])
      }
    }
  }
  return(retmat)
}
# check the function
mymat <- matrix(1:4,2,2)
prop_matrix(mymat,margin=1)
prop_matrix(mymat,margin=2)
mymat <- matrix(1:12,3,4)
prop_matrix(mymat,margin=1)
prop_matrix(mymat,margin=2)

# Question 5
margin_matrix <- function(amatrix,margin=12){
  mymatrix <- matrix(0,nrow = nrow(amatrix),ncol = ncol(amatrix))
  if (margin==1){
    add_column <- rowSums(amatrix)
    margin_matrix <- cbind(amatrix,add_column)
    colnames(margin_matrix) <- NULL
  }
  
  if (margin==2){
    add_row <- colSums(amatrix)
    margin_matrix <- rbind(amatrix,add_row)
    rownames(margin_matrix) <- NULL
  }
  if (margin==12){
    add_column <- rowSums(amatrix)
    add_row <- colSums(amatrix)
    margin_matrix1 <- cbind(amatrix,add_column)
    new_colsum <- colSums(margin_matrix1)
    margin_matrix <- rbind(margin_matrix1,new_colsum)
    rownames(margin_matrix) <- NULL
    colnames(margin_matrix) <- NULL
  }
  return(margin_matrix)
}
# check the function
mymat <- matrix(1:4,2,2)
margin_matrix(mymat,1)
margin_matrix(mymat,2)
margin_matrix(mymat,12)
mymat <- matrix(1:12,3,4)
margin_matrix(mymat,1)
margin_matrix(mymat,2)
margin_matrix(mymat,12)

# Question 6
myf <- function(model,incr=0.1){
  num.misclas <- vector()
  tresholds <- vector()
  cycle <- seq(0.1,0.9,by=incr)
  for ( ii in 1: length(cycle)){
    newpreds <- ifelse(as.vector(model$fitted.values) >= cycle[ii],1,0)
    num.misclas[ii]<- length(newpreds[newpreds!=(model$y)])
    tresholds[ii] <- cycle[ii]
    names(num.misclas) <- tresholds
  }
  return(num.misclas)
}
# check for the function
transmission_preds <-glm(am~mpg+wt,data=mtcars)
myf(transmission_preds)
myf(transmission_preds,.05)

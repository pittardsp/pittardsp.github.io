#1
# method 1. use sapply to solve the problem:
sort(sapply(split(pres.data,pres.data$cand_nm), function(x) sum(x$contb_receipt_amt)))

# method 2. use tapply to solve the problem:
sort(tapply(pres.data$contb_receipt_amt,pres.data$cand_nm,FUN=sum))

#2
biggest.donors <- function(candidate.name, x=3) {
  retvec <- data.frame()
  
  if (!is.character(candidate.name)){
    stop ("The argument is not a character string!")
  }
  is.wholenumber <- function(x, tol = .Machine$double.eps^0.5)  abs(x - round(x)) < tol
  if (!is.wholenumber(x)) {
    stop ("x needs to be an integer!")
  }
  
  myret1 <- pres.data[pres.data$cand_nm==candidate.name,]  # extract the data frame for the candidate of interest
  
  myret2 <- myret1[order(-myret1$contb_receipt_amt),]  #re-arrange the data frame based on the contribution amount
  
  retvec <- myret2[1:x,]  # get the x biggest donations for the candidate of interest
  
  return(retvec)
}



#3
create.dna <- function(dna.length=20,cagt.probs=c(.25,.25,.25,.25)) {
  
  if (dna.length <=0) {
    stop("The sequence length needs to be positive")
  }
  if ( min(cagt.probs) <=0 | max(cagt.probs) >=1 |sum(cagt.probs) !=1){
    stop("The sampling probabilities need to be between 0 and 1 and add to 1")
  }
  dna.seq <- sample(c("C","A","G","T"), dna.length, replace=T, prob=cagt.probs)
  dna.compressed <- paste(dna.seq,collapse="")
  myreturnlist <- list(dna.seq.compressed=dna.compressed, dna.seq.separated=dna.seq, sampling.probabilities=cagt.probs, observed.frequencies=prop.table(table(dna.seq)))
  return(myreturnlist)
}

#4
prop_matrix <- function(somematrix,margin=1) {
  retmat <- matrix()
  
  if (margin == 1) {
    retmat <- somematrix/rowSums(somematrix)
  }
  else if (margin == 2) {
    retmat <- t(t(somematrix)/colSums(somematrix))
  }
  else {
    stop ("A margin value can only be 1 or 2")
  }
  return(retmat)
}

#5
margin_matrix <- function(somematrix,margin=12) {
  myretmat<-matrix()
  
  if (margin==1) {
    myretmat <- cbind(somematrix,rowSums(somematrix))
  }
  
  else if (margin==2) {
    myretmat <- rbind(somematrix,colSums(somematrix))
  }
  
  else if (margin==12) {
    my.somemat <- rbind(somematrix,colSums(somematrix))
    myretmat <- cbind(my.somemat,rowSums(my.somemat))
  }
  else {
    stop ("A margin value can only be 1,2, or 12 ")
  }
  return (myretmat)
}

#6
myf <- function(model,incr=0.1) {
  
  retvec <- vector()
  jj<-1
  
  for (ii in seq(0.1,0.9,incr)) {
    newpreds <- ifelse(as.vector(model$fitted.values) >= ii,1,0)
    mytable <- table(our_preds=newpreds,actual=model$y)
    
    retvec[jj]<-sum(mytable)-sum(diag(mytable))
    jj<-jj+1

  }
  names(retvec) <- seq(0.1,0.9,incr)
  return(retvec)
}

#  Homework 2
#  Ziyi Li

url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]
str(pres.data)

# 1
sapply(split(pres.data,pres.data$cand_nm),function(x) sum(x$contb_receipt_amt))[order(sapply(split(pres.data,pres.data$cand_nm),function(x) sum(x$contb_receipt_amt)))]

# 2
biggest.donors <- function(candidate.name, x = 3){
  if(!is.character(candidate.name)){
    stop("I need character value for candidate name!")
  } else if(!is.numeric(x)){
    stop("I need an integer value for x!")
  } else{
    x <- round(x)
    selected<-pres.data[pres.data$cand_nm == candidate.name,]
    ordered<-selected[order(selected$contb_receipt_amt,decreasing=T),]
    return(as.data.frame(ordered[1:x,]))
  }
}
biggest.donors(candidate.name = "Trump, Donald J.", x = 2)

# test with wront inputs
biggest.donors(candidate.name = 4, x='4')
biggest.donors(candidate.name = "Trump, Donald J.", x = '2')
biggest.donors(candidate.name = "Trump, Donald J.")

# 3
create.dna <- function(length = 20, cagt.probs = c(0.25,0.25,0.25,0.25)){
  dna <- c('A','T','G','C')
  dna.sequence <- sample(dna,size=length,replace=T,prob=cagt.probs)
  summary <- list(dna.seq.compressed=paste(dna.sequence,sep="",collapse=""),
                  dna.seq.separated=dna.sequence,sampling.probabilities=cagt.probs,
                  observed.frequencies=table(dna.sequence)/length)
  return(summary)  
}

create.dna()
create.dna(10,cagt.probs=c(.1,.4,.3,.2))

# 4
prop_matrix <- function(somematrix,margin=1) {
  # Input: somematrix - a numeric matrix
  # Output: a numeric matrix with margins added
  if(!is.matrix(somematrix) | !is.numeric(margin)){
    stop('somematrix needs to be a somematrix, margin needs to be a numeric value!')
  } else if (is.matrix(somematrix) & is.numeric(margin) & margin==1){
    retmat <- somematrix/rowSums(somematrix)
  } else if (is.matrix(somematrix) & is.numeric(margin) & margin==2){
    retmat <- t(t(somematrix)/colSums(somematrix))
  }
  return(retmat)
}

mymat <- matrix(1:4,2,2)

prop_matrix(mymat,1)
prop_matrix(mymat,2)

# test with wrong inputs
prop_matrix('hello',1)
prop_matrix(mymat,'no')

# 5

margin_matrix <- function(somematrix, margin=12){
  if(margin == 1){
    retmat <- cbind(somematrix,rowSums(somematrix))
  } else if (margin == 2){
    retmat <- rbind(somematrix,colSums(somematrix))
  } else if (margin == 12){
    retmat <- cbind(somematrix,rowSums(somematrix))
    retmat <- rbind(retmat,colSums(retmat))
  }
  return(retmat)
}

mymat <- matrix(1:4,2,2)
margin_matrix(mymat,12)
margin_matrix(mymat,1)
margin_matrix(mymat,2)

# 6

myf <- function(model,incr=0.1) {
  # Input: model - A glm model
  # incr - An increment value by which to increment
  # between 0.1 and 0.9
  # Output: A named vector containing the number of misclassified predictions
  # the element names are the respective thresholds
  loop <- seq(incr,1-incr,incr)
  retvecm <- rep(0, length(loop))
  names(retvecm) <- loop
  
  for (i in 1:length(loop)){
    threshold <- i*incr
    newpreds <- ifelse(as.vector(model$fitted.values) >= threshold,0,1)
    summary <- table(our_preds=newpreds,actual=model$y)
    retvecm[i] <- summary[2,2]+summary[1,1]
  }
  return(retvecm)
}

data(mtcars)
transmission_preds <-glm(am~mpg+wt,data=mtcars)
myf(transmission_preds)
myf(transmission_preds,.05)


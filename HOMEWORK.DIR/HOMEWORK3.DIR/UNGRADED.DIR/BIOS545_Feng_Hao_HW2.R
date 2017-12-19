#BIOS 545 HW2

#1
setwd("/Users/Harry/Dropbox/2016 Spring/BIOS 545/hw2/")
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv" 
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL) 
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

sort(sapply(unique(as.character(pres.data$cand_nm)), function(x) { sum(pres.data[pres.data$cand_nm==x,"contb_receipt_amt"]) }))

#2
biggest.donors <- function(candidate.name, x = 3){
  #error checking to ensure that candidate.name is a character string
  if (!is.character(candidate.name)){
    stop("The input candidate name is not character string")
  }
  #x is an integer
  if (!(x %% 1 == 0)){
    stop("x must be an integer!")
  }
  #x is positive
  if (!(x>0)){
    stop("x must be positive!")
  }
  
  
  temp1 <- pres.data[pres.data$cand_nm==candidate.name,]
  idx <- order(temp1$contb_receipt_amt, decreasing = T)[1:x]
  result <- temp1[idx,]
  return(result)
}


biggest.donors(candidate.name = "Trump, Donald J.", x = 2)


#3

create.dna <- function(length = 20, atcg.prob = c( 0.25, 0.25, 0.25, 0.25)){
  #length is positive
  if (!(length>0)){
    stop("length must be positive!")
  }
  #prob is positive
  if (!(sum(atcg.prob>=0&atcg.prob<=1)==4)){
    stop("each probability must be in [0,1]")
  }
  #prob is sum up to 1
  if (!(sum(atcg.prob)==1)){
    stop("ATCG probability must sum up to 1!")
  }
  
  
    #prob is assigned in the order of A, T, C, G
  dna.sequence <- sample(c("A", "T", "C", "G"), size = length, replace = T, prob = atcg.prob)
  
  dna.seq.compressed <- paste(dna.sequence, collapse = "")
  dna.seq.separated <- dna.sequence
  sampling.probabilities <- atcg.prob
  observed.frequencies <- table(dna.sequence)
  
  result <- list(dna.seq.compressed=dna.seq.compressed,dna.seq.separated=dna.seq.separated,sampling.probabilities=sampling.probabilities,observed.frequencies=observed.frequencies)
  return(result)
}

create.dna()
create.dna(10,atcg.prob=c(.1,.4,.3,.2))
#create.dna(-9,atcg.prob=c(.1,.4,.3,.2))
#create.dna(10,atcg.prob=c(2,.4,.3,.2))
#create.dna(10,atcg.prob=c(0.8,.4,.3,.2))


#4
prop_matrix <- function(somematrix,margin=1){
  temp1 <- rowSums(somematrix)
  temp2 <- colSums(somematrix)
  if (margin ==1 ){
    retmat <- somematrix/temp1
  } else {
    retmat <- t(t(somematrix)/temp2)
  }
  return(retmat) 
}


mymat <- matrix(1:4,2,2)
prop_matrix(mymat,1)
prop_matrix(mymat,2)

#5
margin_matrix <- function(somematrix,margin=12){
  if (margin ==1 ){  retmat <- cbind(somematrix,rowSums(somematrix)) } 
  if (margin ==2 ){  retmat <- rbind(somematrix,colSums(somematrix)) } 
  if (margin ==12 ){  retmat <- rbind(cbind(somematrix,rowSums(somematrix)),c(colSums(somematrix),sum(somematrix))) } 
  return(retmat) 
}


mymat <- matrix(1:4,2,2)
margin_matrix(mymat,1)
margin_matrix(mymat,2)
margin_matrix(mymat,12)


#6
transmission_preds <- glm(am~mpg+wt,data=mtcars)
as.vector(transmission_preds$fitted.values)

(newpreds <- ifelse(as.vector(transmission_preds$fitted.values) >= 0.5,1,0))
table(our_preds=newpreds,actual=transmission_preds$y)

myf <- function(model,incr=0.1) {

  goseq <- seq(from=0.1,to=0.9,by=incr)
  retvec <-c()
  for (i in 1:length(goseq)){
    newpreds <- ifelse(as.vector(model$fitted.values) >= goseq[i],1,0)
    conf <- table(our_preds=newpreds,actual=model$y)
    error.num <- conf[1,2]+conf[2,1]
    
    retvec <- c(retvec, error.num)
  }
  
  names(retvec) <- goseq
  return(retvec)
}

myf(transmission_preds,.05)
myf(transmission_preds,.02)

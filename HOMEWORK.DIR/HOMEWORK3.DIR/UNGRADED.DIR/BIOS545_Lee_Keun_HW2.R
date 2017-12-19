#Homework 2 (due: 2/12/16)                          Keun Lee


#Quesiton 1:
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file (url,"P00000001-ALL.csv")
pres.data <- read.table ("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names (pres.data) <- c ( names (pres.data)[-1], "x")
pres.data <- pres.data[, - ncol (pres.data)]

sort(sapply(split(pres.data, pres.data$cand_nm),function(x) sum(x$contb_receipt_amt)))


#Question 2:

biggest.donors <- function(candidate.name,x=3) {
  if (!is.character(candidate.name)){
    stop("Invalid Candidate Name. Please check again.")
  }
  if (!is.numeric(x)){
    stop("Invalid value for X entered.")
  }
  y <- subset(pres.data, cand_nm==candidate.name)
  z <- order(y$contb_receipt_amt, decreasing=TRUE)
  y2 <- y[z,]
  final <- head(y2, x)
  return(final)
}


#Question 3:

dnaseq <- function(len=20,cgat.prob=c(.25,.25,.25,.25)) {
  dna <- c("C", "G", "A", "T")
  if (any(cgat.prob>1) | any(cgat.prob<0) | sum(cgat.prob)!=1 | !is.numeric(len)) {
    stop("Invalid numeric entry. Please check again")
  }
  else {
    dna.sequence <- sample(dna, len, prob=cgat.prob, replace=TRUE)
    b <- paste(dna.sequence, collapse="")
    c <- cgat.prob
    t <- table(dna.sequence)
    d <- prop.table(t)
    all.four <- list(dna.seq.compressed=b, dna.seq.separated=dna.sequence ,sampling.probabilities=c, observed.frequencies=d)
  }
  return(all.four)
}


#Question 4: ((UPDATED))

mymat <- matrix(1:4,2,2)    ##margin=1 "row%"; 2= "col%"
prop_matrix <- function(mat, margin=1) {
  if (margin!=1 & margin!=2){   
    stop("Invalid margin entry.")
    }
  if (margin==1) {
    result <- mat/rowSums(mat) 
  }
  if (margin==2) {
    result.1 <- t(mat)/rowSums(t(mat))
    result <- t(result.1)
  }
  return(result)
}


#Question 5:

margin_matrix <- function(mat,margin=1) {
  if (margin!=1 & margin!=2 & margin!=12){   
    stop("Invalid margin entry.")
  }
  if (margin==1) {
    result <- cbind(mat,rowSums(mat))
  }
  if (margin==2) {
    result <- rbind(mat,colSums(mat))
  }
  if (margin==12) {
    result.a <- cbind(mat,rowSums(mat))
    result <- rbind(result.a, colSums(result.a))
  }
  return(result)
}


#Question 6:
transmission_preds <- glm (am~mpg+wt,data=mtcars)
as.vector (transmission_preds$fitted.values)
(newpreds <- ifelse ( as.vector (transmission_preds$fitted.values) >= 0.5,1,0))
table (our_preds=newpreds,actual=transmission_preds$y)

myf <- function(model,incr=0.1) {
  vec <- vector()
  sequence <- seq(.1,.9,incr)
  if (!is.numeric(incr)) {    
    stop("Invalid increment entry. Please enter a number")
  }
  else for (ii in 1:length(sequence)) {   ## for-loop for each increment
    newpreds <- ifelse ( as.vector (model$fitted.values) >= sequence[ii],1,0)
    t <- table (our_preds=newpreds,actual=model$y)
    vec[ii] <- sum(t[2,1]+t[1,2])
  }
  names(vec) = sequence
  return(vec)
}


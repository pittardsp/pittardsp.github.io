# Question: 1 -------------------------------------------------------------
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

ls(pres.data)

sort(sapply((split(pres.data[,10], pres.data$cand_nm)), sum))


# Question: 2 -------------------------------------------------------------


biggest.donors <- function(candidate.name, x=3){
  if (!is.character(candidate.name)) {
    stop("candidate name must be a character string ")
  }
  if (x %% 1 != 0 ) {
    stop("numeric value must be an integer")
  }
  
  split.by.cand <- split(pres.data, pres.data$cand_nm)
  specific.cand <- split.by.cand[[candidate.name]]
  ordered.specific.cand <- specific.cand[rev(order(specific.cand$contb_receipt_amt)),]
  #testing <- specific.cand[1:x]
  sum.cand <- head(ordered.specific.cand, x)
  return(sum.cand)
  
}

biggest.donors(candidate.name="Trump, Donald J.", x = 3)
#biggest.donors(candidate.name="Trump, Donald J.", x = 7)
#biggest.donors(candidate.name=8 , x = 3)
#biggest.donors(candidate.name="Trump, Donald J." , x = 3.5)


#Question: 3-----------------------------------------------------------

create.dna <- function(seqlength=20, probability) { 
  if (sum(probability <= 0) | sum(probability > 1)) {      
    stop("nucleotide probability needs to be between 0 and 1")
  }
  if (sum(probability) != 1) {
    stop("sum of probability must equal to 1")
  }
  if (seqlength < 0) {
    stop("Length must be greater than 0")
  }
  nucleotide <- c("C", "A", "G", "T")
  dna.sequence <- sample(nucleotide, seqlength, replace=TRUE, prob=probability)
  
  frequency = table(dna.sequence)
  prob.frequency = frequency/sum(frequency)
  collapseddna=paste(dna.sequence, collapse="")
  mylist <- list(dna.sequence.compressed=collapseddna, dna.sequence.separated=dna.sequence, dna.sequence.probabilities=probability, dna.sequence.frequencies=prob.frequency )
  
  return(mylist)
}

create.dna(20, c(0.25, 0.25, 0.25, 0.25))
#create.dna(-1, c(0.25, 0.25, 0.25, 0.25))
#create.dna(10, c(0.35, 0.25, 0.25, 0.25))
#create.dna(20, c(2, 0.25, 0.25, 0.25))
#create.dna(20, c(-2, 0.25, 0.25, 0.25))


#Question: 4-------------------------------------------------------------------

mymat <- matrix(1:10, 2, 5)
mymat2 <- matrix(1:20, 4, 5)


prop_matrix <- function(mymat, margin = 1) {
  if (margin == 1) {
    rowresult = c()
    for (ii in 1:nrow(mymat)) {
      matrixrowsum <- apply(mymat, 1, sum)
      currentrowresult <- mymat[ii,]/matrixrowsum[ii]
      rowresult = c(rowresult, currentrowresult)
    }
    matrixresult <- matrix(rowresult,nrow=nrow(mymat),ncol=ncol(mymat), byrow=TRUE)
    return(matrixresult)
  }
  
  if (margin == 2) {
    colresult = c()
    for (ii in 1:ncol(mymat)) {
      matrixcolsum <- apply(mymat, 2, sum)
      currentcolresult <- mymat[,ii]/matrixcolsum[ii]
      colresult = c(colresult, currentcolresult)
    }
    matrixresult <- matrix(colresult,nrow=nrow(mymat),ncol=ncol(mymat), byrow=FALSE)
    return(matrixresult)
  }
  
  if (margin < 1) {
    warning("Please use margin value of 1 or 2")
  }
  if (margin > 2) {
    warning("please use margin value of 1 or 2")
  }
}

mymat <- matrix(1:4, 2, 2)
prop_matrix(mymat, 1)
prop_matrix(mymat, 2)
#prop_matrix(mymat, 3)

#Question: 5 -------------------------------------------------------------------

margin_matrix <- function(mymat, margin=12) {
  if (margin == 1) {
    rowsum <- apply(mymat, 1, sum)
    combined <- cbind(mymat, rowsum)
    matrixized <- matrix(combined, nrow=nrow(mymat), ncol=(ncol(mymat)+1) )
    return(matrixized)
  }
  if (margin == 2) {
    colsum <- apply(mymat, 2, sum)
    combined <- rbind(mymat, colsum)
    matrixized <- matrix(combined, nrow=(nrow(mymat)+1), ncol=ncol(mymat) )
    return(matrixized)
  }
  if (margin == 12) {
    rowsum <- apply(mymat, 1, sum)
    with.row <- cbind(mymat, rowsum)
    
    new.colsum <- apply(with.row, 2, sum)
    with.row.column <- rbind(with.row, new.colsum)
    new.matrix <- matrix(with.row.column, nrow=(nrow(mymat)+1), ncol=(ncol(mymat)+1))
    return(new.matrix)
  }
  if (margin != 1|2|12) {
    warning("Please use margin values of 1, 2, or 12")
  }
}

margin_matrix(mymat, margin=1)
margin_matrix(mymat, margin=2)
margin_matrix(mymat, margin=12)
# margin_matrix(mymat, margin=13)

#Question: 6 -------------------------------------------------------------------



transmission_preds <-glm(am~mpg+wt,data=mtcars) 

myf <- function(model, incr=0.1) {
  misspred.vec = c()
  incr.vec <- seq(from=0.1,to=0.9, by=incr)
  for (ii in 1:length(incr.vec)) {
    as.vector(transmission_preds$fitted.values)
    (newpreds <- ifelse(as.vector(transmission_preds$fitted.values) >= incr.vec[ii],1,0))
    confusion.matrix <- table(our_preds=newpreds,actual=transmission_preds$y)
    rev.confusionmatrix <- t(apply(confusion.matrix,1, rev))
    miss.pred <- sum(diag(rev.confusionmatrix))
    misspred.vec = c(misspred.vec, miss.pred)
  }
  names(misspred.vec) <- incr.vec 
  return(misspred.vec)
}

myf(transmission_preds, 0.1)
#myf(transmission_preds, 0.01)
#myf(transmission_preds, 0.05)



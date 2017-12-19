url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]
names(pres.data)
head(pres.data)
sort(by(pres.data$contb_receipt_amt, pres.data$cand_nm, FUN=sum)) #1

biggest.donors <- function(x=3,candidate.name) {
  if(!is.character(candidate.name) | !is.numeric(x)){
    stop("check the input!")
  }
  rownum <- which(pres.data[,"cand_nm"]==candidate.name)
  donor.matrix <- pres.data[rownum,]
  odernum <- order(donor.matrix[,"contb_receipt_amt"],decreasing=TRUE)
  sorted.mat <- donor.matrix[odernum,]
  return (sorted.mat[1:x,])
}
biggest.donors(candidate.name = "Trump, Donald J.", x = 2) #2

create.dna <- function(l=20,base=c('C','A','G','T'),p=c(0.25,0.25,0.25,0.25)) {
  if(l<=0){
    stop("please use a positive number")
  }
  for(ii in 1:length(p)){
    if(p[ii]<0|p[ii]>1){
      stop("the probability should be between 0 and 1")
    }
  }
  dna.seq <- sample(base,l, prob=p,replace=TRUE)
  dna.seq.seperate <- dna.seq
  dna.seq.comp <- paste(dna.seq,collapse="")
  observed.freqencies <- table(dna.seq)/l
  sampling.probability <- p
  ret.list <- list(dna.seq.seperate = dna.seq.seperate,dna.seq.compressed = dna.seq.comp, 
              sampling.probability=sampling.probability,observed.freqencies=observed.freqencies)
  return (ret.list)
}
create.dna()
create.dna(l=50,p=c(0.1,0.4,0.3,0.2)) #3

prop_matrix <- function(somematrix, margins){
  if(margins==2){
    return (t(t(somematrix)/colSums(somematrix)))
  }else if(margins==1){
    return (somematrix/rowSums(somematrix))
  }else{
    stop("invalid type")
  }
}
my.mat <- matrix(c(1:8),2,4)
prop_matrix(my.mat,2) #4

margin_matrix <- function(somematrix, margin=12){
  if(margin == 1){
    return (cbind(somematrix,rowSums(somematrix)))
  }else if(margin == 2){
    return (rbind(somematrix,colSums(somematrix)))
  }else if(margin == 12){
    temp.matrix <- cbind(somematrix,rowSums(somematrix))
    return (rbind(temp.matrix,colSums(temp.matrix)))
  }else{
    stop("Invalid margin type")
  }
}
test.mat <- matrix(1:12,3,4)
margin_matrix(test.mat,2) #5

myf <- function(model, incre =0.1) {
  retvec <- vector()
  number <- seq(from=0.1, to=0.9, by=incre)
  for (ii in 1:length(number)){
    preds <- as.vector(model$fitted.values)
    newpreds <- ifelse(preds >= number[ii],1,0)
    conclusion <- as.data.frame.matrix(table(ourpreds = newpreds, actual = model$y))
    mismatch <- conclusion[1,2]+conclusion[2,1]
    retvec <- c(retvec,mismatch)
  }
  names(retvec) <- number[1:length(number)]
  return (retvec)
}
transmission_preds <-glm(am~mpg+wt,data=mtcars) 
myf(transmission_preds)
myf(transmission_preds,.05)










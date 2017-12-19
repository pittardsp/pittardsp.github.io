#1-2
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

#1
sort(sapply(split(pres.data,pres.data$cand_nm) , function(x) sum(x$contb_receipt_amt)))

#2
biggest.donors <- function(candidate.name,x=3) {
  
  check.integer <- function(N){
    !grepl("[^[:digit:]]", format(N,  digits = 20, scientific = FALSE))
  }
  
  
  if (!is.character(candidate.name)) {
    stop("I need character string to make this work")
  }
  if (!check.integer(x)) {
    stop("I need integer to make this work")
  }
  byname<-split(pres.data, pres.data$cand_nm)
  name<-byname[[candidate.name]]
  ret<-head(name[rev(order(name$contb_receipt_amt)),],x)
  return(ret)
}
biggest.donors(candidate.name = "Trump, Donald J.", x = 2)


#3
create.dna<- function(DNAlength=20,cagt.probs=c(.25,.25,.25,.25)){
  if (!DNAlength>0|!is.numeric(DNAlength) ) {
    stop(" The sequence length must be a positive number")
  }
  for (ii in 1:4){
    
    if (!cagt.probs[ii]>=0|!cagt.probs[ii]<=1 ) {
      stop(" The sampling probabilities must be all between 0 and 1.")
    }
    
  }
  if (!sum(cagt.probs)==1 ) {
    stop(" The sampling probabilities must add to 1")
    
  }
  dna.seq.separated<-sample(c("A","C","G","T"),DNAlength ,replace = TRUE,prob=cagt.probs)
  dna.seq.compressed<-paste(dna.seq.separated, collapse = "")
  sampling.probabilities<-cagt.probs
  dna.sequence<-dna.seq.separated
  observed.frequencies<- table(dna.sequence)/DNAlength
  ret<-list(dna.seq.compressed=dna.seq.compressed,dna.seq.separated=dna.seq.separated,sampling.probabilities=sampling.probabilities,observed.frequencies=observed.frequencies)
  return(ret)
  
}
create.dna()

create.dna(10,cagt.probs=c(.1,.4,.3,.2))





#4
prop_matrix<-function(somematrix,margin=1) {
  # Input: somematrix - a numeric matrix # Output: a numeric matrix with margins added
  if (margin==1){
    for (ii in 1:nrow(somematrix)) {
      somematrix[ii,]<-somematrix[ii,]/rowSums(somematrix)[ii]
    }
    
  }
  if (margin==2){
    
    for (ii in 1:ncol(somematrix)) {
      somematrix[,ii]<-somematrix[,ii]/colSums(somematrix)[ii]
      
    }
  }
  retmat<-somematrix
  return(retmat)
  
}

mymat <- matrix(1:4,2,2)

prop_matrix(mymat,1)
prop_matrix(mymat,2)


#5
margin_matrix<-function(somematrix,margin=1) {
  if (margin==1){
    retmat<-cbind(somematrix,rowSums(somematrix))
  }
  if (margin==2){
    
    retmat<-rbind(somematrix,colSums(somematrix))
  }
  if (margin==12){
    retmat<-cbind(somematrix,rowSums(somematrix))
    retmat<-rbind(retmat,colSums(retmat))
  }
  return(retmat)
  
}
mymat <- matrix(1:4,2,2)
margin_matrix(mymat,1)
margin_matrix(mymat,2)
margin_matrix(mymat,12)


#6

myf <- function(model,incr=0.1) {
  
  # Input: model - A glm model
  
  # incr - An increment value by which to increment
  
  # between 0.1 and 0.9
  
  # Output: A named vector containing the number of misclassified predictions # the element names are the respective thresholds
  
  ret<-vector()
  
  a<-seq(0.1,0.9,by=incr)
  
  
  for (ii in 1:length(a)) {
    newpreds <- ifelse(as.vector(model$fitted.values) >= a[ii],1,0)
    result<-table(our_preds=newpreds,actual=model$y)
    ret[ii]=result[1,2]+result[2,1]
    
  }
  names(ret)<-seq(0.1,0.9,by=incr)
  
  return(ret)
  
}
transmission_preds <-glm(am~mpg+wt,data=mtcars) 
myf(transmission_preds)
myf(transmission_preds,.05)
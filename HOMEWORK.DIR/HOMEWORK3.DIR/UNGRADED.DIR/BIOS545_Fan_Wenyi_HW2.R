url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL) 
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]
head(pres.data,10)

#1
sort(tapply(pres.data$contb_receipt_amt,pres.data$cand_nm, FUN=sum))

#2 
biggest.donors<-function(candidate.name,x=3) {
  cname<-pres.data[which(pres.data$cand_nm==candidate.name),]
  bigset<-cname[order(cname$contb_receipt_amt,decreasing = TRUE)[1:x],]
  return(bigset)
}

biggest.donors(candidate.name = "Trump, Donald J.", x = 2)

#3
create.dna<-function(n=20,prob=c(0.25,0.25,0.25,0.25)) {
  if (n<=0 &!is.numeric(n) & sum(prob)!=1 & sum(prob<0)>0 & sum(prob>1)>0){
    stop("Need valid info")
  }
  if (n<=0){ 
    stop("Need valid info about positive n")
    }
  if (!is.numeric(n)){
    stop ("Need valid info about integer n")
  }
  if (sum(prob)!=1){
    stop ("Need the prob's sum to 1")
  }
  if (sum(prob<0)>0){
    stop ("Need the probabilities larger than 0")
  }
  if (sum(prob>1)>0){
    stop ("Need the probabilities smaller than 1")
  }
  dna<-sample(c("A","C","G","T"),n,prob,replace=TRUE)
  compressed<-paste(dna,sep="",collapse = "")
  seperated<-dna
  dnalist<-list(dna.seq.compressed=compressed,dna.seq.seperated=seperated,sampling.probabilities=prob,observed.frequencies=table(dna))
  return(dnalist)
}
create.dna(n=-50,prob = c(0.2,0.5,0.1,0.2))

#4
prop_matrix<-function(somematrix,margin=1) 
  {if(margin==2){
    a<-colSums(somematrix)
    b<-rep(a,each=nrow(somematrix))
  retmat<-somematrix/b
  }else{ 
  retmat<-somematrix/rowSums(somematrix)
  }
  return(retmat) 
}
my <- matrix(1:12,3,4)
prop_matrix(my,1)
prop_matrix(my,2)


#5
margin_matrix<-function(somematrix,margin=12){
  if (margin==1){
  newmat<-cbind(somematrix,rowSums(somematrix))
  }else if (margin==2){
  newmat<-rbind(somematrix,colSums(somematrix))
  }else{
    a<-cbind(somematrix,rowSums(somematrix))
    newmat<-rbind(a,colSums(a))
  }
  return(newmat)
}
mymat <- matrix(1:9,3,3)
margin_matrix(mymat,1)
margin_matrix(mymat,2)
margin_matrix(mymat,12)


#6

myf <- function(model,incr=0.1) {
  transmission_preds <-glm(am~mpg+wt,data=mtcars)
  myseq<-seq(0.1, 0.9, incr)
  retvec<-c()
  for (ii in 1:length(myseq)){
  newpreds <- ifelse(as.vector(transmission_preds$fitted.values)>= myseq[ii],1,0)
  retvec[ii]<-length(transmission_preds[transmission_preds$y!=newpreds])
  }
  names(retvec)<-myseq
  return(retvec)
}

myf(transmission_preds,0.001)


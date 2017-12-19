#HW2-1 1/20 5 aggregation/summarize
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x") 
pres.data <- pres.data[, -ncol(pres.data)]

sort(tapply(pres.data$contb_receipt_amt, pres.data$cand_nm, sum))

#hw2-2 error checking 2/1 21
biggest.donors <- function(candidate.name,x=3) {
  if(!is.character(candidate.name)|round(x)!=x) {
    stop ("I need real value to make this work")
  }
  list1<-pres.data[which(pres.data$cand_nm==candidate.name),]
  list2<-list1[order(list1$contb_receipt_amt, decreasing = "T"),]
  biggestx<-list2[1:x,]
  return(biggestx)
}
biggest.donors(candidate.name = "Trump, Donald J.", x=2)

#hw2-3 error checking first//////list
create.dna<-function(x=20,cagt.probs=c(0.25,0.25,0.25,0.25)) {
  if (!is.numeric(x)&x<=0|min(cagt.probs)>1|max(cagt.probs)<0|!sum(cagt.probs) ==1) {
    stop("I need more proper value to make it")
  }
  dna.sequence<-sample(c("A", "C", "G","T"),x,replace=T, prob=cagt.probs)
  dna.compressed<-paste(dna.sequence,collapse="")
  dna.list<-list(dna.seq.compressed=dna.compressed, dna.sequence.seperated=dna.sequence, 
                 sampling.probabilities=cagt.probs,observed.frequencies=prop.table(table(dna.sequence)))
  return(dna.list)
}
create.dna()
create.dna(10,cagt.probs=c(.1,.4,.3,.2))

#hw2-4 prop.table////matrix////for loop
prop.matrix<-function(smat, margin=1) {
  mymatrix<-matrix(,nrow(smat),ncol(smat))
  for (ii in 1:nrow(smat)) {
    for (jj in 1:ncol(smat)){
      if(margin==1){
        mymatrix[ii,jj]<-smat[ii,jj]/rowSums(smat)[ii]
      }else if (margin==2) {
        mymatrix[ii,jj]<-smat[ii,jj]/colSums(smat)[jj]
      }
    }
  }
  return(mymatrix)
}
mymat<-matrix(1:6, 3, 2)
prop.matrix(mymat,2)
 
#hw2-5 if else
margin_matrix<-function(smat, margin=12) {
  if (margin==1) {
    rsumm<-rowSums(smat)
    mymatrix2<-cbind(smat,rsumm,deparse.level = 0)
    }else if (margin==2){
        csumm<-colSums(smat)
        mymatrix2<-rbind(smat, csumm, deparse.level = 0)
    }else if (margin==12) {
        rsumm<-rowSums(smat)
        mymatrix3<-cbind(smat,rsumm,deparse.level = 0)
        csumm<-colSums(mymatrix3)
        mymatrix2<-rbind(mymatrix3, csumm, deparse.level = 0)
      }
    return(mymatrix2)
}
mymat<-matrix(1:6, 3,2)
margin_matrix(mymat)

#hw2-6 ifelse
myf<-function(model, incr=0.1) {
  misclass<-vector()
  for (ii in 1:length(seq(0.1, 0.9, by=incr))) {
    newpreds <-ifelse(as.vector(model$fitted.values)>=0.1+incr*(ii-1),1,0)
    test_table<-table(our_preds=newpreds, actually=model$y)
    misclass[ii]<-test_table[1.2]+test_table[2,1]
  }
  names(misclass)<-seq(0.1,0.9, by=incr)
  return(misclass)
}
#test
transmission_preds<-glm(am~mpg+wt, data=mtcars)
myf(transmission_preds)

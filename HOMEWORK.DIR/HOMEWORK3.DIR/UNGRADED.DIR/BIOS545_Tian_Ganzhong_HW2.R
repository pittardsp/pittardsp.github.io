########Question 1-2##########

url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

#####Question-1######

sort(tapply(pres.data$contb_receipt_amt, pres.data$cand_nm,sum), decreasing = FALSE)

#####Question-2######

biggest.donors<-function(candidate.name,x=3){
if(is.character(candidate.name)){
  a<-pres.data[pres.data$cand_nm==candidate.name,]
  a<-a[order(a$contb_receipt_amt,decreasing = TRUE),]
}
else{
  stop("Give me a Character as Candidate name!!")
}
  return(a[1:x,])
}

biggest.donors(candidate.name="Trump, Donald J.")
biggest.donors(candidate.name="Trump, Donald J.",x=2)


#####Question-3######

Create.DNA<-function(length=20,cagt.probs=c(0.25,0.25,0.25,0.25)){

  if(length<=0){
      stop("Length should be a positive integer number")
  }
  else{
      if(sum(cagt.probs)!=1|!all(cagt.probs<=1 & cagt.probs>=0)){
        stop("the sampling probabilities are all between 0 and 1, and add to 1")  
      }
      else{
          dna.sequence<-sample(c("A","C","G","T"),length,replace=TRUE,cagt.probs)
          dna.compressed<-paste(dna.sequence, collapse="")
          dna.frequencies<-table(dna.sequence)/length
          out<-list(dna.seq.compressed=dna.compressed,dna.seq.separated=dna.sequence,sampling.probabilities=cagt.probs,observed.frequencies=dna.frequencies)
      }
  }
return(out)
}

Create.DNA(length=40,cagt.probs=c(0.4,0.3,0.2,0.1))
Create.DNA(length=40,cagt.probs=c(-0.4,0.3,0.2,0.1))
Create.DNA(length=40,cagt.probs=c(0.5,0.3,0.2,0.1))
Create.DNA(length=4.2,cagt.probs=c(0.4,0.3,0.2,0.1))

#####Question-4######

prop_matrix<-function(somematrix,margin=1) {
  # Input: somematrix - a numeric matrix
  # Output: a numeric matrix with margins added
if((margin!=1)&(margin!=2)){
    stop("margin should be either 1 or 2")
}
else{
  if(margin==1){
    retmat<-somematrix/rowSums(somematrix)
  }
  if(margin==2){
    retmat<-t(t(somematrix)/colSums(somematrix))
  }
}
  return(retmat)
}

#######testing######
a<-matrix(1:4,2,2)

prop_matrix(a)
prop_matrix(a,2)

#####Question-5######

margin_matrix<-function(somematrix,margin=12) {
  # Input: somematrix - a numeric matrix
  # Output: a numeric matrix with margins added
  if((margin!=1)&(margin!=2)&(margin!=12)){
    stop("margin should be either 1 or 2 or 12")
  }
  else{
    if(margin==2){
      retmat<-rbind(somematrix,colSums(somematrix))
    }
    if(margin==1){
      retmat<-cbind(somematrix,rowSums(somematrix))
    }
    if(margin==12){
      retmat<-cbind(rbind(somematrix,colSums(somematrix)),append(rowSums(somematrix),sum(somematrix)))
    }
  }
  return(retmat)
}

#######testing######

b<-matrix(1:4,2,2)

margin_matrix(b)
margin_matrix(b,1)
margin_matrix(b,2)

#####Question-6######

myf <- function(model,incr=0.1) {
  # Input: model - A glm model
  # incr - An increment value by which to increment
  # between 0.1 and 0.9
  # Output: A named vector containing the number of misclassified predictions
  # the element names are the respective thresholds
  
  seqvec<-seq(0.1,0.9, by=incr)#between 0.1 and 0.9 in increments of ``incr''
  
  retvec<-vector(mode="numeric",length=length(seqvec))#Setup a blank return vector
  names(retvec)<-seqvec
  #Create the threshold indices along which to loop - that is create a sequence of numbers
  
  for (i in 1:length(retvec)) { #Loop over each of the threshold indices
    
    newpreds <- ifelse(as.vector(model$fitted.values) >= seqvec[i],1,0)#Create a "prediction" vector based on the model$fitted.values
    table(our_preds=newpreds,actual=model$y)->table#Create a table based on the predicted values vs the actual y values from the model
    num_misclass<-table[1,2]+table[2,1]##Determine the numer of misclassifications for the given threshold
    retvec[i]<-num_misclass#Put that number in the return vector
  }#End loop
  return(retvec)#Name the return vector using the threshold values
}

transmission_preds <-glm(am~mpg+wt,data=mtcars)
myf(transmission_preds)
myf(transmission_preds,.05)






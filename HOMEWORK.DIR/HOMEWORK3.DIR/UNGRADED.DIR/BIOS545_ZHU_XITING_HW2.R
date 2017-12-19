#1
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv" 
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL) 
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

sort(sapply(split(pres.data,pres.data$cand_nm),function(x)sum(x$contb_receipt_amt)))

#2
candidate <- split(pres.data,pres.data$cand_nm)  #split the pres.data by candidates' names
biggest.donors <- function(candidate.name,x=3){
  if(!is.character(candidate.name)){   #check whether the variable "candidate.name" gives a character string
    stop("I need character.name to be a character string!")
  }
  if(round(x)!=x){ #check whether the variable x gives an integer
    stop("I need x to be an integer!")
  }
  name <- candidate[[candidate.name]]  #pick the "candidate.name" from the "candidate"
  donors <- name[order(-name$contb_receipt_amt),] #arrange the "name" by increasing contribution amount order
  return(head(donors,x))
}

#3
set.seed(188)
DNA <- function(long=20,somevec=c(.25,.25,.25,.25)){ #set the default of probabilities
  if(!is.numeric(long)){ 
    stop("I need the sequence length to be a number!")
  }
  if(long <= 0){
    stop("I need the sequence length to be a positive number")
  }
  for (ii in 1:length(somevec)){ #check if the probabilities are between 0 and 1
    if (somevec[ii]<0 | somevec[ii]>1){
      stop("I need the probabilities to be between 0 and 1")
    }
    if (sum(somevec)!=1){  #check if the sum of the probabilities is 1
      stop("I need the sum of the probabilities to be 1")
    }
  }
  my.dna <- c("C","A","G","T")
  dna.seq.separated <- sample(my.dna,long,replace=TRUE,prob=somevec)
  dna.seq.compressed <- paste(dna_1,collapse = "")
  sampling.probabilities <- somevec
  names(somevec)<-my.dna
  out <- list(dna.seq.compressed,dna.seq.separated,sampling.probabilities,somevec)
  return(out)
}

#4
prop_matrix <- function(somematrix,margin=1){
  if(margin == 1){
    for(ii in 1:nrow(somematrix)){
      somematrix[ii,] <- somematrix[ii,]/rowSums(somematrix)[ii]
    }
  }
  if(margin == 2){
    for(ii in 1:ncol(somematrix)){
      somematrix[,ii] <- somematrix[,ii]/colSums(somematrix)[ii]
    }
  }
  retmat <-somematrix
  return(retmat)
}

#5
margin_matrix <- function(somematrix,margin=12){
  if(margin==1){
    retmat <- cbind(somematrix,rowSums(somematrix))
  }
  if(margin==2){
    retmat <- rbind(somematrix,colSums(somematrix))
  }
  if(margin==12){
    retmat <- cbind(somematrix,rowSums(somematrix))
    retmat<-rbind(retmat,colSums(retmat))
  }
  return(retmat)
}

#6
myf <- function(model,incr=0.1){
  retvec <- vector()
  myseq <- seq(0.1,0.9,by=incr)
  for(ii in 1:length(myseq)){
    as.vector(model$fitted.values)
    newpreds <- ifelse(as.vector(transmission_preds$fitted.values) >=myseq[ii],1,0)
    my.table <- table (our_preds=newpreds,actual=transmission_preds$y)
    misclass <- my.table[1,2] + my.table[2,1]
    retvec[ii] <- misclass
  }
  names(retvec)<-myseq
  return(retvec)
}








    
   
    
    
    





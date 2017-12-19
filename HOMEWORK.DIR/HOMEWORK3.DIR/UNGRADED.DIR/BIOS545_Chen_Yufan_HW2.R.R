url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

# Question 1
sort(tapply(pres.data$contb_receipt_amt,pres.data$cand_nm,sum))


# Question 2
biggest.donors <- function(candidate.name,x=3){
  if (!is.character(candidate.name)|round(x)!=x){
    stop("I need real value to make this work")
  }
  newlist <- pres.data[which(pres.data$cand_nm==candidate.name),]
  newlist2 <- newlist[order(newlist$contb_receipt_amt,decreasing=T),]
  biggestx <- newlist2[1:x,]
  return(biggestx)
}
biggest.donors(candidate.name = "Trump, Donald J.", x = 2)


# Question 3
create.dna <- function(x=20,cagt.probs=c(0.25,0.25,0.25,0.25)){
  if (is.numeric(x)&x<=0|min(cagt.probs)>1|max(cagt.probs)<0|!sum(cagt.probs)==1){
    stop("we need proper value to make it")
  }
  dna.sequence <- sample(c("A","C","G","T"),x,replace=T,prob=cagt.probs)
  dna.compressed <- paste(dna.sequence,collapse="")
  dna.list <- list(dna.seq.compressed=dna.compressed,dna.seq.seperated=dna.sequence,
                   sampling.probabilities=cagt.probs,observed.frequencies=prop.table(table(dna.sequence)))
  return(dna.list)
}
create.dna()
create.dna(10,cagt.probs=c(.1,.4,.3,.2))


# Question 4
prop_matrix <- function(somemat,margin=1){
  mat <- matrix(,nrow(somemat),ncol(somemat))
  for (ii in 1:nrow(somemat)){
    for (jj in 1:ncol(somemat)){
      if (margin ==1){
        mat[ii,jj] <- somemat[ii,jj]/rowSums(somemat)[ii]
      } else if (margin == 2){
        mat[ii,jj] <- somemat[ii,jj]/colSums(somemat)[jj]
      }
    }
  }
  return(mat)
}

mymat <- matrix(1:6,3,2)
prop_matrix(mymat,2)


# Question 5
margin_matrix <- function(somemat,margin=12){
  if (margin == 1){
    rsummat <- rowSums(somemat)
    newmat <- cbind(somemat,rsummat,deparse.level = 0)
  }else if (margin == 2){
    csummat <- colSums(somemat)
    newmat <- rbind(somemat,csummat,deparse.level = 0)
  }else if (margin == 12){
    rsummat <- rowSums(somemat)
    bind_mat <- cbind(somemat,rsummat,deparse.level = 0)
    csummat <- colSums(bind_mat)
    newmat <- rbind(bind_mat,csummat,deparse.level = 0)
  }
  return(newmat)
}
mymat <- matrix(1:6,2,3)
margin_matrix(mymat)


# Question 6
myf <- function(model,incr=0.1){
  misclass <- vector()
  for (ii in 1:length(seq(0.1,0.9,by=incr))){
    newpreds <- ifelse(as.vector(model$fitted.values) >= 0.1+incr*(ii-1),1,0)
    test_table <- table(our_preds=newpreds,actual=model$y)
    misclass[ii] <- test_table[1,2]+test_table[2,1]
  }
  names(misclass) <- seq(0.1,0.9,by=incr)
  return(misclass)
}

transmission_preds <-glm(am~mpg+wt,data=mtcars)
myf(transmission_preds)




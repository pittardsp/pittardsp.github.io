
# Question 1
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

sort(tapply(pres.data$contb_receipt_amt,pres.data$cand_nm,sum))


# Question 2 ****
biggest.donors <- function(candidate.name,x=3){
  if (!is.character(candidate.name)){
    stop("Invalid Candidate Name!")
  }else if (!is.numeric(x) | x<=0 ){
    stop("Invalid x")
  }else{
    new_data <- pres.data[candidate.name==pres.data$cand_nm,]
    sorted_data <- new_data[rev(order(new_data$contb_receipt_amt)),]
    return(sorted_data[1:x,])
  }
}
biggest.donors(candidate.name = "Trump, Donald J.", x = 2)



# Question 3
create.dna <- function(myl=20,cagt.probs=c(0.25,0.25,0.25,0.25)){
  if (myl <= 0 | !is.numeric(myl)){
    stop("Invalid DNA Sequence Length")
  }else if (sum(cagt.probs) != 1 | min(cagt.probs)<0 | max(cagt.probs)>1){
    stop("Invalid Sampling Probabilities")
  }else{
    sim_dna <- sample(c("C","A","G","T"),myl,replace=TRUE,prob=cagt.probs)
    return.list <- list()
    return.list$dna.seq.compressed <- paste(sim_dna,collapse="")
    return.list$dna.seq.separated <- sim_dna
    return.list$sampling.probabilities <- cagt.probs
    return.list$observed.frequencies <- prop.table(table(sim_dna))
    return(return.list)
  }
}
create.dna()
create.dna(10,cagt.probs=c(.1,.4,.3,.2))


# Question 4
prop_matrix <-function(mymat,margin=1){
  if (margin != 1 & margin != 2){
    stop("Invalid Number of MARGIN")
  }else if (margin == 1){
    new_mat <- mymat
    for (ii in 1:nrow(mymat)){
      for (jj in 1:ncol(mymat)){
        new_mat[ii,jj] <- mymat[ii,jj]/rowSums(mymat)[ii]
      }
    }
    return(new_mat)
  }else if (margin == 2){
    new_mat <- mymat
    for (ii in 1:nrow(mymat)){
      for (jj in 1:ncol(mymat)){
        new_mat[ii,jj] <- mymat[ii,jj]/colSums(mymat)[jj]
      }
    }
    return(new_mat)
  }
}
mymat <- matrix(1:4,2,2)
prop_matrix(mymat,1)
prop_matrix(mymat,2)


# Question 5
margin_matrix <- function(mymat,margin=12){
  if (margin != 1 & margin != 2 & margin != 12){
    stop("Invalid Number of MARGIN")
  }else if (margin == 1){
    new_mat = cbind(mymat,rowSums(mymat))
    return(new_mat)
  }else if (margin == 2){
    new_mat = rbind(mymat,colSums(mymat))
    return(new_mat)
  }else if (margin == 12){
    new_mat1 = cbind(mymat,rowSums(mymat))
    new_mat2 = rbind(new_mat1,colSums(new_mat1))
    return(new_mat2)
  }
}
mymat <- matrix(1:4,2,2)
margin_matrix(mymat,1)
margin_matrix(mymat,2)
margin_matrix(mymat,12)

# Question 6
data(mtcars)
transmission_preds <- glm(am~mpg+wt,data=mtcars)
as.vector(transmission_preds$fitted.values)
myf <- function(transmission_preds,incr=0.1){
  retvec <- vector()
  name_vec <- vector()
  n <- 1
  for (ii in seq(0.1,0.9,incr)){
    newpreds <- ifelse(as.vector(transmission_preds$fitted.values) >= ii,1,0)
    new_mat <- table(our_preds=newpreds,actual=transmission_preds$y)
    retvec[n] <- round(new_mat[1,2]+new_mat[2,1])
    name_vec[n] <- ii
    n <- n+1
  }
  names(retvec) <- name_vec
  return(retvec)
}
myf(transmission_preds,0.1)
myf(transmission_preds,0.05)

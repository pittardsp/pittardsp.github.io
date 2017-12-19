#Isaac Parakati
#Bios545
#021016

# Problem 1
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

sort(sapply(split(pres.data, pres.data$cand_nm),function(x) sum(x$contb_receipt_amt)))


# Problem 2
biggest.donors <- function(candidate.name, x=3) {
  #error checking
  if (!is.character(candidate.name)) {
    stop("Please input a candidate name.")
  }
  if (!is.numeric(x)) {
    stop("Please input an integer for number of biggest donations
         you would like to see.")
  }
  candidate_grps <- split(pres.data, pres.data$cand_nm)
  name_location <- grep(candidate.name,names(candidate_grps))
  picked_candidate <- candidate_grps[[name_location]]
  head(picked_candidate)
  picked_candidate[rev(order(picked_candidate$contb_receipt_amt)),][1:x,]
}

biggest.donors(candidate.name = "Trump, Donald J.", x=2)


# Problem 3
create.dna <- function(how.long=20, cagt.probs=c(0.25,0.25,0.25,0.25)) {
  if (how.long <1) {
    stop("Enter a positive number")
  }
  if (length(cagt.probs[0 <= cagt.probs & cagt.probs <= 1]) < 4) {
    stop("Make sure sampling probabilities are between 0 and 1")
  }
  if (!sum(cagt.probs[1:4])==1) {
    stop("Make sure sampling probabilities add to 1")
  }
  dna.sequence <- sample(c("A","C","G","T"), how.long, replace=TRUE, prob=cagt.probs)
  return(list(dna.seq.compressed=paste(dna.sequence, collapse=""),
              dna.seq.separated=dna.sequence,
              sampling.probabilities=cagt.probs,
              observed.frequencies=table(dna.sequence)/how.long))
}

create.dna()
create.dna(10,cagt.probs=c(.1,.4,.3,.2))


# Problem 4
prop_matrix <- function(somematrix,margin=1) {
  if (margin==1) {
    retmat <- somematrix/rowSums(mymat)
  }
  if (margin==2) {
    retmat <- cbind(somematrix[,1]/colSums(somematrix)[1],
          somematrix[,2]/colSums(somematrix)[2])
  }
  return(retmat)
}

mymat <- matrix(1:4, 2,2)
prop_matrix(mymat,1)
prop_matrix(mymat,2)


# Problem 5
margin_matrix <- function(somematrix, margin=12) {
  if (margin==1) {
    retmat <- cbind(somematrix, rowSums(somematrix))
  }
  if (margin==2) {
    retmat <- rbind(somematrix, colSums(somematrix))
  }
  if (margin==12) {
    retmat <- rbind(cbind(somematrix, rowSums(somematrix)),
          colSums(cbind(somematrix, rowSums(somematrix))))
  }
  return(retmat)
 }
 
mymat <- matrix(1:4, 2,2)
margin_matrix(mymat, 1)
margin_matrix(mymat, 2)
margin_matrix(mymat, 12)


# Problem 6

myf <- function(model, incr=0.1) {
  # blank return vector
  incr.vector <- seq(0.1, 0.9, by=incr)
  # looping over threshold indices in return vector
  retvec <- sapply(incr.vector, function(incr) {
    # making prediction vector
    (newpreds <- ifelse(as.vector(model$fitted.values) >= incr,1,0))
    # table of predicted y vs actual y
    confusion.table <- table(our_preds=newpreds,actual=model$y)
    # summing number of misclassfications and putting in return vector
    incorrect.value <- confusion.table[2,1] + confusion.table[1,2]
  })
  #naming return vector using threshold values
  names(retvec) <- incr.vector
  return(retvec)
}

transmission_preds <-glm(am~mpg+wt,data=mtcars)
myf(transmission_preds)
myf(transmission_preds, 0.05)


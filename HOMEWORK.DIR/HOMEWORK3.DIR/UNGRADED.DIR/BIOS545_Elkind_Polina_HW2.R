
#Polina Elkind
#R: 545 HW2

url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

#question 1
sort(tapply(as.numeric(pres.data$contb_receipt_amt),pres.data$cand_nm,sum))


#question 2

biggest.donors <- function(candidate.name,x=3)
  
  { 
  
  if (is.character(candidate.name) == FALSE)
  {stop("candidate.name requires a character string entry")} 
  
  if ((x %% 1 ==0) == FALSE)
  {stop("ERROR: x requires an integer entry")} 
  
  if (x<0)
  {stop("ERROR: x requires a positive entry")} 
   
  single.cand <- subset(pres.data,pres.data$cand_nm == candidate.name) #subset the 
                                                                      #data to only include
                                                                      #candidate of interest
  
  sorted <- single.cand[order(-single.cand$contb_receipt_amt),] #sort rows
                                                                #by decreasing donation
                                                                #amount
  
  sorted[(1:x),] #display only rows containing "x" highest donations
  
  }

biggest.donors("Trump, Donald J.",2)


#question 3

create.dna <- function(length=20,probs=c(0.25,0.25,0.25,0.25))
  
  {
  
  if (length <0)
  {stop("ERROR: sequence length must be positive")}
  
  a=probs[1]
  b=probs[2]
  c=probs[3]
  d=probs[4]
  
  if (a<0 | a>1) 
  {stop("ERROR: each prob must be between 0 and 1")}
  
  if (b<0 | b>1)
  {stop("ERROR: each prob must be between 0 and 1")}
  
  if (c<0 | c>1)
  {stop("ERROR: each prob must be between 0 and 1")}
  
  if (d<0 | d>1)
  {stop("ERROR: each prob must be between 0 and 1")}
  
  if (a+b+c+d != 1)
  {stop("ERROR: probs must sum to 1")}
   
  dna <- c("C","A","G","T") #options to sample from
  
  my.dna <- sample(dna,length,replace=TRUE,prob=c(a,b,c,d)) #create a sample 
                                                            #from the four nucleotides
  
  dna.seq.compressed <- paste(my.dna,sep="", collapse="") #compressed version of sequence
  
  dna.seq.separated <- as.character(my.dna) #separated version of sequence
  
  sampling.probabilities <- as.numeric(c(a,b,c,d)) #vector of sampling probs
  
  observed.frequencies <- prop.table(table(my.dna)) #frequencies for C, A, G, T in
                                                    #resulting sample
  
  myreturnlist <- list(dna.seq.compressed=dna.seq.compressed,
                       dna.seq.separated=dna.seq.separated,
                       sampling.probabilities=sampling.probabilities,
                       observed.frequencies=observed.frequencies) #list of items to return
  
  return(myreturnlist)
  
  }

create.dna()
create.dna(10,probs=c(.1,.4,.3,.2))


#question 4

prop_matrix <- function(somematrix,margin=1)
  
  {

  somematrix <- mymat
   
  if (margin==1) #if new matrix displays row proportions
  {retmat <- (somematrix/rowSums(somematrix))}
  
  if (margin==2) #if new matrix displays column proportions
  {retmat <- (somematrix/colSums(somematrix))}
  
  return(retmat)
  
  }

mymat <- matrix(1:4,2,2)
prop_matrix(mymat,1)
prop_matrix(mymat,2)


#question 5

margin_matrix <- function(mymat,margin=12)
  
  {
  
  if (margin==1) #new matrix displays row sums
  {newmatrix <- cbind(mymat,rowSums(mymat))}
  
  if (margin==2) #new matrix displays column sums
  {newmatrix <- rbind(mymat,colSums(mymat))}
  
  if (margin==12) #new matrix displays both row and column sums
  {newmatrix.first <- cbind(mymat,rowSums(mymat))
  newmatrix <- rbind(newmatrix.first,colSums(newmatrix.first))}
  
  return(newmatrix)
  
  }

mymat <- matrix(1:4,2,2)
margin_matrix(mymat,1)
margin_matrix(mymat,2)
margin_matrix(mymat,12)


#question 6

myf <- function(model,incr=0.1)
  
  {

  retvec <- vector() #vector into which results are deposited
  
  seq <- seq(0.1,0.9,by=incr) #create vector for varying sequence
  
  for (ii in 1:length(seq)) 
  
    { #what are our predictions? based on if/then statement using seq of threshold values
    (newpreds <- ifelse(as.vector(model$fitted.values) >= seq[ii],1,0))
    #what are the predicted values?
    prediction <- as.vector(model$fitted.values)
    #create a matrix comparing our preds versus actual preds
    matr <- as.matrix(table(our_preds=newpreds,actual=model$y))
    #how many misclassifications? sum the off-diagonal entries
    retvec[ii] <- sum(matr[row(matr)!=col(matr)])
    }

  names(retvec) <- seq #vector of # of missclass's, including the respective thresh values

  return(retvec)
  
  }

transmission_preds <-glm(am~mpg+wt,data=mtcars)
myf(transmission_preds)
myf(transmission_preds,.05)





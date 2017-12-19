# Hanna Mar
# Bios 545
# Homework #2


# Question #1

url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <-  pres.data[, -ncol(pres.data)]

sort(sapply(split(pres.data,pres.data$cand_nm),function(x) sum(x$contb_receipt_amt)))

# Question #2

biggest.donor <- function(candidate.name, x = 3){
  if (!is.character(candidate.name)){
    stop("Please provide a candidate's name")
  }
  if (x%%1 != 0){
    stop("Please provide an integer")
  }
  hold <- split(pres.data, pres.data$cand_nm)
  contrib <- hold[[candidate.name]]
  newdata <- contrib[order(-contrib$contb_receipt_amt),]
  retval <- newdata[1:x,]
  return(retval)
}

biggest.donor("Trump, Donald J.", x = 2)

# Question #3

createdna <- function(len = 20, vecprob = c(.25, .25, .25, .25)){
  if (length(len) < 1){
    stop("Need a sequence length > 0")
  }
  
  if (sum(vecprob >= 0) < 4 | sum(vecprob <= 1) < 4){
    stop("Probabilities must be between 0 and 1")
  }
  
  if (sum(vecprob) != 1){
    stop("Probabilties must sum to 1")
  }
  
  dnaseq <- sample(c("A", "C", "G", "T"), len, replace = TRUE, prob = vecprob)
  dnaseq.compress <- paste(dnaseq,collapse="")
  dnafreq <- table(dnaseq)/len
  retvals <- list(dnaseq.compress, dnaseq, vecprob, dnafreq)
  return(retvals)
}

createdna()
prob <- c(0.3, 0.2, 0.25, .25)
createdna(30, prob)

# Question #4

prop_mat <- function(mat = matrix(1:4,2), margin = 1){
  if (margin == 1){
    row.sum <- rowSums(mat)
    prob.mat <- matrix(mat/row.sum,nrow(mat))
  }
  if (margin == 2){
    probs <- c()
     for (i in 1:nrow(mat)){
      for (j in 1:ncol(mat)){
        prob.temp <- mat[i,j]/(colSums(mat)[j])
        probs <- c(probs, prob.temp)
      }
     }
    prob.mat <- matrix(probs,nrow(mat), ncol(mat) , byrow = TRUE)
    
  }
  return (prob.mat)
}

my.mat <- matrix(1:4,2,2)
my.mat
prop_mat(my.mat,2)

# Question #5

margin_matrix <- function(mat = matrix(1:4,2,2), margin = 12){
  if (margin == 1){
    row.sum <- rowSums(mat)
    new.mat <- cbind(mat,row.sum)
    
  }
  if (margin == 2){
    col.sum <- colSums(mat)
    new.mat <- rbind(mat,col.sum)
  }
  
  if (margin == 12){
    col.sum <- colSums(mat)
    row.sum <- c(rowSums(mat), sum(col.sum))
    new.mat <- rbind(mat,col.sum)
    new.mat <- cbind(new.mat, row.sum)
  }
  vec.mat <- c(new.mat)
  ret.mat <- matrix(vec.mat,nrow(new.mat), ncol(new.mat))
  return(ret.mat)
}

margin_matrix(margin = 2)

margin_matrix(matrix(1:9,3,3), 12)

# Question #6

myf <- function(model, incr = 0.1){
  if (((1/incr) %% 1) != 0){
    stop("Please choose an increment that will divide evenly")
  }
  if (incr > 1){
    stop("Please choose an increment between 0 and 1")
  }
  
  num_int <- seq(0.1,0.9, incr)
  misclass <- c()
  increments <- c()
  for (ii in 1:length(num_int)){
    newpreds <- ifelse(as.vector(transmission_preds$fitted.values) >= (num_int[ii]),1,0)
    pred_table <- table(our_preds=newpreds,actual=transmission_preds$y)
    misclass_sum <- sum(pred_table[1,2] + pred_table[2,1])
    misclass <- c(misclass, misclass_sum)
    incr_name <- num_int[ii]
    increments <- c(increments,incr_name)
    #cat("inc = ", increments, "misclass = ", misclass, "\n")
  }
  
  names(misclass) <- increments
  
  return(misclass)
  
}

transmission_preds <- glm(am~mpg+wt,data=mtcars)
#model <- as.vector(transmission_preds$fitted.values)

myf(model,0.05)
myf(model, 0.1)
myf(model, 0.2)


# Lael Rayfield
# BIOS 545 HW 2
# 2-5-16

# Problem 1

# read in and download the csv file
url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

sort(sapply(split(pres.data,pres.data$cand_nm),function(x) sum(x$contb_receipt_amt)))

#--------------------------------------------------------------------------------

# Problem 2

biggest.donors <- function(candidate.name,x){
  # split by candidate name
  new <- split(pres.data, pres.data$cand_nm)
  # use that and index the candidate name
  index <- new[[candidate.name]]
  # order it by decreasing order
  y <- order(index$contb_receipt_amt, decreasing = TRUE)
  data2 <- index[y,]
  # return indexes up to x
  data3 <- data2[1:x,]
  return(data3)
}

#--------------------------------------------------------------------------------

#Problem 3

create.dna <- function(len, probs = c(probc, proba, probg, probt)){
  if(missing(len)){
    # defualt length
    len = 20
  }
  # default probabilities
  if(missing(probs)){
    probs =c(0.25, 0.25, 0.25, 0.25)
  }
  if (len <= 0) {
    stop("Length of DNA string must be greater than 0")
  }
  if (all(probs > 0) != TRUE | all(probs < 1) != TRUE) {
    stop("All probabilities must be between 0 and 1")
  }
  dna.sequence <- sample(c("C","A","G","T"), len, prob = probs, replace = TRUE)
  compress <- (paste(dna.sequence, collapse=""))
  
  table <- table(dna.sequence)
  
  freq <- table/sum(table)
  
  output <- list(dna.seq.compressed=compress, dna.seq.separated=dna.sequence, sampling.probabilities=probs, observed.frequencies=freq)
  
  return(output)
}


#--------------------------------------------------------------------------------

# Problem 4

prop_matrix <- function(matrix, margin){
  if(margin != 1 & margin != 2){
    stop("Must enter either 1 or 2 for the second argument")
  }
  if(is.matrix(matrix) != TRUE){
    stop("First argument must be a real matrix!")
  }
  
  if(margin == 1){
    sum_row <- rowSums(matrix, na.rm = FALSE, dims = 1)
    for(i in 1:nrow(matrix)){
      for(j in 1:ncol(matrix)){
        matrix[i,j] = matrix[i,j]/(sum_row[i])
      }
    }
  }
  
  if(margin == 2){
    sum_col <- colSums(matrix, na.rm = FALSE, dims = 1)
    for(i in 1:ncol(matrix)){
      for(j in 1:nrow(matrix)){
        matrix[j,i] = matrix[j,i]/(sum_col[i])
      }
    }
  }
  
  return(matrix)
}


#--------------------------------------------------------------------------------

# Problem 5

margin_matrix <- function(matrix, margin){
  # set default margin value
  if(missing(margin)){
    margin = 12
  }
  if(margin != 1 & margin != 2){
    margin = 12
  }
  
  if(margin == 1){
    row_total <- rowSums(matrix, na.rm = FALSE, dims = 1)
    final <- cbind(matrix, row_total)
    # remove column header
    colnames(final) <- NULL
    return(final)
    
  }
  
  if(margin == 2){
    col_total <- colSums(matrix, na.rm = FALSE, dims = 1)
    final <- rbind(matrix, col_total)
    # remove row header
    rownames(final) <- NULL
    return(final)
  }
  
  if(margin == 12){
    row_total <- rowSums(matrix, na.rm = FALSE, dims = 1)
    temp <- cbind(matrix, row_total)
    col_total <- colSums(temp, na.rm = FALSE, dims = 1)
    final <- rbind(temp, col_total)
    # remove all header
    colnames(final) <- NULL
    rownames(final) <- NULL
    return(final)
  
  }
}

#--------------------------------------------------------------------------------

# Problem 6

transmission_preds <- glm(am~mpg+wt,data=mtcars)

prob_6 <- function(model, incr){
  as.vector(model$fitted.values)
  retvec <- vector(mode="numeric", length=0)
  indicies <- seq(from = 0.1 , to = 0.9, by = incr)
  for(i in 1:length(indicies)){
    num <- indicies[i]
    newpreds <- ifelse(as.vector(model$fitted.values) >= num,1,0)
    tab <- table(our_preds=newpreds,actual=model$y)
    # add up the diagonal values of matrix, store in variable
    sum <- tab[2,1]+tab[1,2]
    # make this sum the ith element of the return vector
    retvec[i] <- sum
  }
  
  # add nems for prettiness
  names(retvec) <- indicies
  return(retvec)
}


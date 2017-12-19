#############################################################################
#                                                                           #
# Andrew Nute                                                               #
# Bios 545                                                                  #
# Homework 2                                                                #
# 2/6/2016                                                                  #
#                                                                           #
#############################################################################



# Bring in the data

url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv" 
download.file(url,"P00000001-ALL.csv") 
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL) 
names(pres.data) <- c(names(pres.data)[-1], "x") 
pres.data <- pres.data[, -ncol(pres.data)]


ls(pres.data)


# Question 1
############


sort(sapply(split(pres.data, pres.data$cand_nm), function(x) sum(x$contb_receipt_amt)), decreasing = FALSE)




# Question 2
############


#current answer

biggest.donors <- function(candidate.name, x = 3) {

  if (!is.character(candidate.name)) {
    stop("only character strings for candidate names")
  }
  
  if (!is.numeric(x)) {
    stop("x needs to be a number")
  }
  
  candidate.subset <- pres.data[pres.data$cand_nm == candidate.name,]
    candidate.subset2 <- candidate.subset[order(candidate.subset$contb_receipt_amt, decreasing = TRUE),]
    
  retval <- candidate.subset2[1:x,]

  return(retval)
}

# check it
biggest.donors("Trump, Donald J.")
biggest.donors(candidate.name = "Trump, Donald J.", x = 2)

# first error check
biggest.donors(2, 2)

# second error check
biggest.donors("Trump, donald J.", "2")

# Question 3
############

Funky.town <- function(dna.length = 20, probs = c(.25, .25, .25, .25)) {

  if (dna.length <= 0) {
    stop("You need a sequence of some length greater than 0")
  }
    
  if (sum(probs) != 1) {
    stop("your probabilities don't sum to 1")
  }
  
  if (sum(probs > 1) >0) {
    stop("It is imposible to have something happen more than 100% of the time.")
  }
  
  if (sum(probs < 0) > 0) {
    stop("NEGATIVE PROBABILITIES!?  Come on bro... get your head in the game")
  }
  
    dna <- c("A", "G", "C", "T")
    my.dna <- sample(dna, dna.length, replace = T, prob = probs)
    ret.dna.charstr <-  paste(my.dna, collapse = "")
    ret.dna.probs <- as.numeric(probs)
    ret.samp.freq <- as.numeric(table(my.dna))/dna.length
      names(ret.samp.freq) <- dna
    
    ret.list <- list(ret.dna.charstr, my.dna, ret.dna.probs, ret.samp.freq)
      names(ret.list) <- c("dna.seq.compressed", "dna.seq.seperated", "sampling.probabilities", "observed.frequencies")
  
  return(ret.list)
}


# check condition 1
Funky.town(dna.length=0,c(.1, .4, .3, .2))

#check condition 2
Funky.town(dna.length=5,c(.4, .6, .3, .2))

#check condition 3
Funky.town(dna.length=5,c(-.1, .6, .3, .2))

#check defaults
Funky.town()











# Question 4
############

mymat <- matrix(1:4, 2, 2)

prop_matrix <- function(somematrix, margin = 1 ) {

  
  ret_matrix <- matrix(rep(0, length(somematrix)))
  dim(ret_matrix) <- dim(somematrix)
  
  rownum <- nrow(somematrix)
  colnum <- ncol(somematrix)
  
  
      if (margin == 1)         {
  
          for (row in 1:rownum) {
          
            for (col in 1:colnum) {
            
              ret_matrix[row, col] <- somematrix[row, col] /sum(somematrix[row,])
            
            }
          }
        }
  
      if (margin == 2)   {
    
        for (row in 1:rownum) {
        
          for (col in 1:colnum) {
        
            ret_matrix[row, col] <- somematrix[row, col] /sum(somematrix[,col])
        
      }
    }
  }
  
      return(ret_matrix)
}


prop_matrix(somematrix = mymat)

prop_matrix(somematrix = mymat, margin = 2)







# Question 5
#############

margin_matrix <-  function(input_matrix, margin = 12) {
  
  ret_matrix <- matrix(rep(0, length(input_matrix)))
  dim(ret_matrix) <- dim(input_matrix)
  
  if (margin == 1)   {
    
    ret_matrix <- cbind(input_matrix, rowSums(input_matrix))
    
  }
  
  
  if (margin == 2)   {
    
    ret_matrix <- rbind(input_matrix, colSums(input_matrix))
    
  }
  
  
  if (margin == 12)   {
    
    ret_matrix <- cbind(input_matrix, rowSums(input_matrix))
    ret_matrix <- rbind(ret_matrix, c(colSums(input_matrix), sum(colSums(input_matrix))))
    
  }
  
  return(ret_matrix)
  
}


#check answers
margin_matrix(mymat, 1)

margin_matrix(mymat, 2)

margin_matrix(mymat, 12)

margin_matrix(mymat)





# Question 6
############


myf <- function(model,incr=0.1) {
  
  retvec <- vector()
  
  log.model <- glm(model, data = mtcars )
    mod.pred.vec <- as.vector(log.model$fitted.values)
    
  loop.seq <- seq(.1, .9, by = incr)
    
    for (ii in loop.seq) {
      
    mod.preds <- ifelse(mod.pred.vec >= ii, 1, 0)
    
     table.vector <- as.vector(table(our.preds = mod.preds, actual= log.model$y))
        vec.addition <- sum(table.vector[2:3])
        
     retvec <- append(retvec, vec.addition)
        
    }
  
  
  names(retvec) <- loop.seq
  
  
  return(retvec)
  
}

myf(model = am~mpg+wt)

myf(model = am~mpg+wt, .05)
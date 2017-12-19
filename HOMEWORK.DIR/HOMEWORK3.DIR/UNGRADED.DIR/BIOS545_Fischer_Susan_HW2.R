
# Problem 1

url <- "http://steviep42.bitbucket.org/YOUTUBE.DIR/P00000001-ALL.csv"
download.file(url,"P00000001-ALL.csv")
pres.data <- read.table("P00000001-ALL.csv", header = TRUE, sep = ",", row.names = NULL)
names(pres.data) <- c(names(pres.data)[-1], "x")
pres.data <- pres.data[, -ncol(pres.data)]

sort(by(pres.data$contb_receipt_amt, pres.data$cand_nm, sum))


# Problem 2

biggest.donors <- function(candidate.name, x=3) {
  if (!is.numeric(x) | !is.finite(x) | x<=0) {
    stop("x argument can only take positive integer values")
  }
  if (!is.character(candidate.name)) {
    stop("candidate.name argument must be a character string")
  }
  if (sum(unique(pres.data$cand_nm)==candidate.name)==0) {
    stop(paste0("no matches found for candidate.name: ", candidate.name," in data frame"))
  }
  if (!x%%1==0) {
    warning("x argument rounded down to nearest integer")
  }
  subdata <- pres.data[pres.data$cand_nm==candidate.name, ]
  subdata <- subdata[order(subdata$contb_receipt_amt, decreasing=TRUE), ]
  if (x>dim(subdata)[1]) {
    x <- dim(subdata)[1]
    warning("x argument exceeded number of contribution records for candidate")
  }
  return(subdata[1:x, ])
}


# Problem 3

dna.sim <- function(seq.length=20, samp.probs=c(0.25, 0.25, 0.25, 0.25)) {
  if (!is.numeric(seq.length) | seq.length<1 | !is.finite(seq.length)) {
    stop("seq.length argument must be a positive integer")
  }
  if (!is.numeric(samp.probs) | !length(samp.probs)==4) {
    stop("samp.probs argument must be a numeric vector of 4 elements")
  }
  if (!sum(samp.probs<=1 & samp.probs>=0)==4) {
    stop("each element of samp.probs argument must be a value between 0 and 1")
  }
  if (!sum(samp.probs)==1) {
    stop("elements of samp.probs argument must sum to 1")
  }
  if (!seq.length%%1==0) {
    warning("seq.length argument rounded down to nearest integer")
  }
  dna.sep <- sample(c("C","A","G","T"), seq.length, replace=TRUE, prob=samp.probs)
  dna.comp <- paste(dna.sep, sep="", collapse="")
  freq <- c(sum(dna.sep=="C"), sum(dna.sep=="A"), sum(dna.sep=="G"), sum(dna.sep=="T"))/floor(seq.length)
  names(samp.probs) <- c("C", "A", "G", "T")
  names(freq) <- c("C", "A", "G", "T")
  return(list(dna.seq.compressed=dna.comp, dna.seq.separated=dna.sep, 
              sampling.probabilities=samp.probs, observed.frequencies=freq))
}

# Problem 4

prop_matrix <- function(mat, margin=1) {
  if (!is.numeric(margin) | (!margin==1 & !margin==2)) {
    stop("margin argument must be a numeric value of either 1 or 2")
  }
  if (!is.numeric(mat) | !length(dim(mat))==2) {
    stop("mat argument must be a numeric matrix of two dimensions")
  }
  if (margin==1) {
    retmat <- mat/rowSums(mat)
  }
  if (margin==2) {
    div <- colSums(mat)
    retmat <- mat/(matrix(div, dim(mat)[1],dim(mat)[2], byrow=TRUE))
  }
  return(retmat)
}


# Problem 5

margin_matrix <- function(mat, margin=12) {
  if (!is.numeric(margin) | (!margin==1 & !margin==2 & !margin==12)) {
    stop("margin argument must be a numeric value of 1, 2, or 12")
  }
  if (!is.numeric(mat) | !length(dim(mat))==2) {
    stop("mat argument must be a numeric matrix of two dimensions")
  }
  if (margin==1 | margin==12) {
    retmat <- cbind(mat, rowSums(mat))
  }
  if (margin==12) {
    retmat <- rbind(retmat, colSums(retmat))
  }
  if (margin==2) {
    retmat <- rbind(mat, colSums(mat))
  }
  return(retmat)
}


# Problem 6

thresh.glm <- function(model, incr=0.1) {
  if (!is.numeric(incr) | incr<=0 | !is.finite(incr)) {
    stop("incr argument must be a positive, finite numeric value")
  }
  if (!class(model)[1]=="glm") {
    stop("model argument must be an object of class glm")
  }
  fit.vals <- as.vector(model$fitted.values)
  res <- vector()                                # initiate vector to store results
  pos <- 1                                       # initiate position number for storing results in res vector
  for (ii in seq(0.1, 0.9, incr)) {
    preds <- ifelse(fit.vals >= ii, 1, 0)
    res[pos] <- sum(table(preds, model$y)[2:3])
    names(res)[pos] <- ii
    pos <- pos+1                                 # move position number forward for storing results
  }
  return(res)
}
  


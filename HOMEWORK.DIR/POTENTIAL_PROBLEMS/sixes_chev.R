sixes <- function(n=4,verbose=F) {
  roll = sample(1:6,n,T)
  if (verbose) print(roll)
  if (sum(roll == 6) > 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

mychev <- function(N=100) {
  retvec = replicate(N,sixes(n=4))
  return(retvec)
}


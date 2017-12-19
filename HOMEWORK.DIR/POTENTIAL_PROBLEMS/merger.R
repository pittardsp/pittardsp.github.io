mynewton <- function(n, guess) {
  numofiters = 0
  tolerance = 0.0001
  diff = n-(guess^2)
  while (abs(diff) >= 0.001) {
    cat("guess is ",guess,"diff is",abs(diff),"\n")
    numofiters = numofiters + 1
    guess = (n/guess + guess)/2
    diff = n-(guess^2)
  }
  cat("guess is ",guess,"diff is",abs(diff),"\n")
 return(c(guess,numofiters))
}

df1 = mtcars[1:10,]
df2 = mtcars[9:12,]

df1 = chickwts[5:10,]
df2 = chickwts[8:14,]

myintersect <- function(df1,df2) {
  retlist = list()
  kk = 1
  for (ii in 1:nrow(df1)) {
    mystr1 = paste(df1[ii,],collapse="")
    for (jj in 1:nrow(df2)) {
      mystr2 = paste(df2[jj,],collapse="")
      if (mystr1 == mystr2) {
        retlist[[kk]] = df1[ii,]
        kk = kk + 1
      }
    }
  }
  return(do.call(rbind,retlist))
}


myintersect2 <- function(df1,df2) {
  retlist = list()
  kk = 1
  for (ii in 1:nrow(df1)) {
    for (jj in 1:nrow(df2)) {
      hold <- df1[ii,] == df2[jj,]
      if (sum(hold) == ncol(df1)) {
        retlist[[kk]] = df1[ii,]
        kk = kk + 1
      }
    }
  }
  return(do.call(rbind,retlist))
}


tmpgrep <- function(qstr,df) {
  kk = 1
  retlist = list()
  for (ii in 1:nrow(df)) {
    if (length(grep(qstr,df[ii,])) > 0) {
      retlist[[kk]] = df[ii,]
      kk = kk + 1
    }
  }
  return(do.call(rbind,retlist))  
}


# Factored version

improve <- function(guess, n) {
  return((n/guess + guess)/2)
}

good_enough <- function(n, guess) {
  diff = abs(n - guess^2)
  return(diff < 0.001)
}

square_root <- function(n, guess) {
  while(!good_enough(n, guess)) {
    guess = improve(guess, n)
  }
  return(guess)
}

my_sqrt <- function(n,guess) {
 r = square_root(n, guess) 
 return(r)
}



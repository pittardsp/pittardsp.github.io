
mynewton <- function(n, guess) {
  maxiters = 100
  numofiters = 0
  tolerance = 0.0001
  diff = n-(guess^2)
  while ((abs(diff) >= 0.001) & (numofiters <= maxiters)) {
    numofiters = numofiters + 1
    guess = (n/guess + guess)/2
    diff = n-(guess^2)
  }
  return(c(guess,numofiters))
}

df1 = mtcars[1:5,]
df2 = mtcars[3:7,]

df1
df2

rnames = rownames(df1)
for (ii in 1:nrow(df1)) {
  hit = grep(rnames[ii],rownames(df2))
  if (length(hit) > 0 ) {
    print(df2[hit,])
  }
}  

blanklist = list()
rnames = rownames(df1)
for (ii in 1:nrow(df1)) {
  hit = grep(rnames[ii],rownames(df2))
  if (length(hit) > 0 ) {
    blanklist[[ii]] = df2[hit,]
  }
}  
print("Here are the records that are common to both data frames")
do.call(rbind,blanklist)

# Our version of split

hold = list()
kk = 1
for (ii in unique(mtcars$cyl)) {
  hold[[kk]] = mtcars[mtcars$cyl == ii,]
  kk = kk + 1
}

names(hold) = unique(mtcars$cyl)

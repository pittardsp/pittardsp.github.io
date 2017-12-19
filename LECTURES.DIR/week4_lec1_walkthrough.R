

sum(x)/length(x)



mysplits = split(mtcars,mtcars$cyl)

length(mysplits)


names(mysplits)

mysplits[1]

mysplits$`4`

mysplits$`4`[,1]

mysplits[1][[1]]

mysplits[1][[1]][1]




####


exampodd <- c(3,6,9,1,10)
svec <- sort(exampodd)

exampodd <- c(3,6,9,1,10)

(svec <- sort(exampodd))

idx <- ceiling((length(svec))/2)

svec[idx]

median(svec)

## Even

( exampeven <- c(11,9,4,7) )

svec <- sort(exampeven)

idx <- (length(svec))/2 # element 2 is one of the middle
mean(c(svec[idx],svec[idx+1])) # Add one to element number (not median(exampeven)




hold = list()
kk = 1
for (ii in unique(mtcars$cyl)) {
  hold[[kk]] = mtcars[mtcars$cyl == ii,]
kk = kk + 1
}
names(hold) = unique(mtcars$cyl)
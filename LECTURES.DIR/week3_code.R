family1 = list(husband="Fred", wife="Wilma", numofchildren=3, agesofkids=c(8,11,14))

family2 = list(husband="Barney", wife="Betty", numofchildren=3, agesofkids=c(3,10,14))

famlist = list(f1=family1,f2=family2)

famlist$f1$agesofkids[3]

for (ii in 1:length(famlist)) {
      elt = famlist[[ii]]
      print(mean(elt$agesofkids))
}



sapply(1:5, function(x) x)

lapply(1:5, function(x) x)

sapply(1:5, function(x) if (x %% 2 == 0) {x} else {as.character(x)})

lapply(1:5, function(x) if (x %% 2 == 0) {x} else {as.character(x)})

myfunc <- function(x) {
  if ( x %% 2 == 0) {
      return(x)
  } else {
      return(as.character(x))
  }
}

lapply(1:5, myfunc)


biocLite("hgu95av2.db")

library("hgu95av2.db")

hgu95av2CHR
CHR map for chip hgu95av2 (object of class "ProbeAnnDbBimap")

length(as.list(hgu95av2CHR))
[1] 12625

chrVec = unlist(as.list(hgu95av2CHR)))

chrVec[1:4]
1000_at   1001_at 1002_f_at 1003_s_at 
"16"       "1"      "10"      "11" 

table(chrVec)

sapply(1:5, myfunc)
# BIOS560R - Week 2 - Wed

# Slide 02

myvec = c(1:12)

dim(myvec) = c(3,4)

myvec
     
# Slide 03

mymat = matrix( c(7, 4, 2, 4, 7, 2), nrow=3, ncol=2) 

mymat
    

# You can specify explicitly the nrow and ncol arguments. Note also that you can request that the rows get filled first as opposed to the columns:

mymat = matrix( c(7, 4, 2, 4, 7, 2), nrow=3, ncol=2, byrow=TRUE)
mymat


# Slide 04

set.seed(123)

X = matrix(rpois(20,1.5),nrow=4)

X    

rownames(X) = paste("Trial",1:nrow(X),sep=".")
X
       
# Slide 05

colnames(X) = paste("P",1:ncol(X),sep=".")

X

# Slide 06

drug.names = c("aspirin","paracetamol","nurofen","hedex","placebo")

colnames(X) = drug.names

X

# Slide 07

X
        
X['Trial.1',]   # Gets all columns for Trial #1

   
# Get's the nurofen column for Trial.1

X['Trial.1','nurofen']


# Slide 08

X
       
X[,'nurofen']                     # Get all Trials for nurofen


X[,'nurofen',drop=FALSE]   # Preserves matrix structure if desired


# Slide 09

set.seed(123)

X = matrix(rpois(9,1.5),nrow=3)

X

X[1,1]     # First row, First Column

X[2,2]     # Second row, Second Column

X[3,3]     # Third row, Third column

diag(X)    

# Slide 10

X

X[1:2,1]     # Gets First and second rows and the first column

X[1:2,2]     # Gets First and second rows and the second column

X[1:2,]      # Gets First and second rows and ALL columns

# Slide 11

X

X[1:4]

X >= 2

X[X >= 2]   # Returns which values are greater or equal to 2

which(X >= 2)   # Returns which elements are greater or equal to 2


# Slide 12

X
    
X %% 2 == 0          # Returns a logical matrix
      
X[ X %% 2 == 0 ]   # Finds the actual element values


# Slide 13

X
    
X[X %%  2 == 0] = 99

X

# Slide 14

X
     
row(X)
     
col(X)      


# Slide 15

row(X) == col(X)

X[row(X) == col(X)]

X[row(X) == col(X)] = 0  # Put zeroes in the diagonal

# Slide 16

set.seed(123) 

X = matrix(rpois(9,1.5),nrow=3)

colnames(X) = c("aspirin","paracetamol","nurofen")

rownames(X) = paste("Trial",1:3,sep=".")

rbind(X,Trial.4=c(4,7,5))


# Slide 17

X
    
rowSums(X)

cbind(X,rowsums = rowSums(X))
       

# Slide 18

set.seed(123) 

X = matrix(rpois(9,1.5),nrow=3)

colnames(X) = c("aspirin","paracetamol","nurofen")

rownames(X) = paste("Trial",1:3,sep=".")

X
        
mean(X[,3])  # Mean of the 3rd column

var(X[3,]) # Variance of the 3rd row


# Slide 19

X

rowSums(X)

colSums(X)

# Slide 20

rowMeans(X)
  
colMeans(X)
  
colMeans(X)[3]

# Slide 21

X[,1]/sum(X[,1])


# To do this for each column we would need to repeat for each column.

X[,2]/sum(X[,2])

# Slide 22

apply(X,2,function(var) var/sum(var))


apply(X,1,function(var) var/sum(var))
 
# Find the distance between each element and the mean of its respective column

apply(X, 2, function(x) x - mean(x))  

# Slide 21

A = matrix(c(1,3,2,2,8,9),3,2)

t(A)

# Slide 23

apply(X, 2, mean)
    
colMeans(X)

# Slide 24

set.seed(123)

mat = matrix(rnorm(1e+06),1000,1000)

dim(mat)

system.time( apply(mat,2,function(x) x/sum(x)) )

set.seed(123)

mat = matrix(rnorm(2.5e+07),5000,5000)

dim(mat)

system.time( apply(mat, 2, function(x) x/sum(x)))

# Slide 25 

A = matrix(c(1,3,2,2,8,9),3,2)

A
    
t(A)
   
# Slide 26 

A
     
B = matrix(c(5,8,4,2),2,2)

A %*% B

# Slide 27 

A = matrix(1:4,2,2)

A

B = solve(A)

B

A %*% B            # We get the identity matrix
     [,1] [,2]
[1,]    1    0
[2,]    0    1


# Slide 28 

A
     
b = c(7,10)

x = solve(A) %*% b

x

# Slide 22

A

B = matrix(c(5,8,4,2),2,2)

A %*% B

# Slide 23

A = matrix(1:4,2,2)

A
    
B = solve(A)

B

A %*% B            # We get the identity matrix



# Slide 39

transvec = c(1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1)

table(transvec)    # Count 'em up. Which are Auto and Manual ?

mytransfac = factor(transvec, levels = c(0,1), labels = c("Auto","Man") )

table(mytransfac)

levels(mytransfac)

mytransfac

# Slide 40

mympg = c(21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,
        10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4)
        
# Slide 41

library(lattice)

xyplot(mpg~wt | mytransfac, mtcars, main="MPG vs Weight - Auto and Manual Transmissions")

bwplot(~mpg|mytransfac, mtcars, main="MPG - Auto and Manual Transmissions",layout=c(1,2))


#

# Slide 42

mympg = c(21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,
        10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4)


tapply(mympg,mytransfac,mean)
    
# Slide 43

cut(0:10,breaks=4)

table(cut(0:10,breaks=4))

# Slide 44

my.cut = cut(0:10,breaks=4,labels=c("Q1","Q2","Q3","Q4")) 

table(my.cut)

# Slide 45

quantile(0:10)
  
table(cut(0:10,breaks=quantile(0:10),include.lowest=TRUE))

# Slide 46

set.seed(123)

exam.score = runif(25,50,100)

cut(exam.score,breaks=c(50,60,70,80,90,100))

cut(exam.score,breaks=c(50,60,70,80,90,100),labels=c("F","D","C","B","A"))
 
my.table = table(cut(exam.score,breaks=c(50,60,70,80,90,100),labels=c("F","D","C","B","A")))

barchart(my.table,main="Grade BarChart",col=terrain.colors(5))

# Slide 48

cut(exam.score,breaks=c(50,60,70,80,90,100))
 
cut(exam.score,breaks=c(50,60,70,80,90,100),right=F)
 
# Slide 49

exam.score = runif(25,50,100)

acount = 0
bcount = 0
ccount = 0
dcount = 0
fcount = 0
exam.score = runif(25,50,100)
for (ii in 1:length(exam.score)) {
  
 if (exam.score[ii] < 60) {fcount = fcount + 1} else
   if ((exam.score[ii] >= 60) & (exam.score[ii] < 70)) {dcount = dcount + 1} else
     if ((exam.score[ii] >= 70) & (exam.score[ii] < 80)) {ccount = ccount +1} else
       if ((exam.score[ii] >= 80) & (exam.score[ii] < 90)) {bcount = bcount +1} else
          if ((exam.score[ii] >= 90) & (exam.score[ii] <= 100)) {acount = acount +1}
}

cat("acount bcount ccount dcount fcount")

cat(acount,bcount,ccount,dcount,fcount)


# Slide 50

mons =c("Jan","Feb","Mar","Apr","May","Jun","Jan","Feb","May","Jun", "Apr","Mar")

my.fact.mons = factor(mons)

my.fact.mons[1] < my.fact.mons[2]

levels(my.fact.mons)

# Slide 51

my.fact.mons = factor(mons, labels=c("Jan","Feb","Mar","Apr","May","Jun"),ordered=TRUE)

my.fact.mons

my.fact.mons[1] < my.fact.mons[2]

table(my.fact.mons)

levels(my.fact.mons)                       # This is what we want !

# Slide 51

family1 = list(husband="Fred", wife="Wilma", numofchildren=3, agesofkids=c(8,11,14))

length(family1)  # Has 4 elements

family1

str(family1)

# Slide 52

family1 = list(husband="Fred", wife="Wilma", numofchildren=3, agesofkids=c(8,11,14))

family1$agesofkids    # If the list elements have names then use "$" to access the element

family1$agesofkids[1:2]

sapply(family1,class)
     
sapply(family1,length)
     
family2 = list("Barney","Betty",2,c(4,6))

# Slide 53

family2 = list("Barney","Betty",2,c(4,6))

family2[4]    # Accesses the 4th index and associated element 

family2[[4]]   # Accesses the 4th element value only - more direct

family2[3:4]   # Get 3rd and 4th indices and associate values

# Slide 54

unlist(family1)

as.numeric(unlist(family1))

# Slide 55

data(mtcars)   # Load mtcars into the environment

mylm = lm(mpg ~ wt, data = mtcars)

print(mylm)

typeof(mylm)

# Slide 56

str(mylm,give.attr=F)  # Lots of stuff here

# Slide 57

names(mylm)

mylm$effects

# Some use the $ notation to extract desired information they want straight from the function call

lm(mpg ~ wt, data = mtcars)$coefficients

# Slide 58

my.summary <- function(x) {
	return.list = list()       # Declare the list

	return.list$mean = mean(x)
	return.list$sd = sd(x)
	return.list$var = var(x)

	return(return.list)   
}
my.summary(1:10)

names(my.summary(1:10))

my.summary(1:10)$var     # Here we exploit the $ notation to get only what we want

# Slide 59

mystring = "This is a test"

mys = strsplit(mystring, " ")

str(mys)

mys

mys[[1]][1]

mys[[1]][1:2]

unlist(mys)


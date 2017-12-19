# SLIDE 5

3+5

typeof(3)

class(3)	# “class” and “mode” can be used interchangeably 

mode(3)

typeof(`+`)
 
as.Date("12/11/10", "%m/%d/%y") + 1

# SLIDE 6

var1 = 3

sqrt(var1)

class(var1)

# SLIDE 7

myvar <- 5

myvar + myvar	# Addition

myvar - myvar  	# Subtraction


myvar * myvar	# Multiplication

myvar / myvar	# Division


myvar ^ myvar	# myvar raised to the power of myvar

# SLIDE 8

class(aa)

aa = as.integer(aa)

class(aa)

aa = 5.67

as.integer(aa)   # Truncates the value - note it doesn’t round.

# SLIDE 9

var.one = "Hello there ! My name is Steve."

var.two = “How do you do ?"

var.one

nchar(var.one)	# Number of characters present

toupper(var.one)

# SLIDE 10

paste(var.one,var.two)

paste(var.one,var.two,sep=":")

strsplit(var.one," ")

#SLIDE 11

my.string = "Hello there. How are you today ?"

is.vector(my.string) # my.string is a character vector

length(my.string)   # The length of the vector is 1

nchar(my.string)    # Number of characters in the string

substr(my.string,1,5)

substr(my.string,1,7)

# SLIDE 12

my.string = "Hello there. How are you today ?"

my.length = nchar(my.string)

temp = character(my.length)

for (i in 1:temp) {
    q[i] = substr(my.string,1,i)
}

temp


# SLIDE 13

Sys.Date()

Sys.Date()+1

class(Sys.Date())

string = "2011-04-27”

class(string)

as.Date(string)

# SLIDE 14

as.Date("03/17/1996")

as.Date("03/17/1996",format="%m/%d/%Y")

as.Date('1/15/2001',format='%m/%d/%Y')

as.Date('April 26, 2001',format='%B %d, %Y')

as.Date("2012-10-27")

# SLIDE 15


my.date = as.Date("2012-10-27")

my.date - 1 

format(my.date,"%Y")   # Note all of these are character strings

format(my.date,"%b")

format(my.date,"%y")

format(my.date,"%b %d")

format(my.date,"%b %d %Y")

format(my.date,"%b %d, %Y")

# SLIDE 16

Sys.time()+1 > Sys.time()


Sys.time()+1 > Sys.time()+3

y2 = as.POSIXct("2009-11-22")
y1 = as.POSIXct("2010-10-11")

y2 - y1


# SLIDE 17

difftime("2005-10-21 08:32:58","2003-8-15 09:18:05")

strptime(c("03/27/2003","03/27/2003","04/14/2008"),format="%m/%d/%Y") 


# SLIDE 18

rdates
   

mean(rdates$Date)

range(rdates$Date)

rdates$Date[11] - rdates$Date[1]

# SLIDE 19

factor(format(rdates$Date,"%Y"))

# SLIDE 20

seq(as.POSIXct("1976-7-4"),by="days",length=10)

seq(as.POSIXct("1976-7-4"),to=as.POSIXct("1976-9-4"),by="2 weeks")

weekdays(my.seq)

months(my.seq)

# SLIDE 23

some.variable = TRUE

some.variable = (4 < 5)

if ( 4 < 5 ) {
  print(“Four is less than Five”)
}

# SLIDE 24

if ( 4 < 5 ) {
  print(“Four is less than Five”)
}

my.var = ( 4 < 5) 

if (my.var) {
  print(“four is less than five”)
}

if (! my.var ) {
   print(“four is greater than five”)
}

my.var = (4 < 5) & ( 4 < 6 ) 

# SLIDE 25

my.var = (4 < 5) | ( 4 < 6 )  # Logical OR operator

my.var

my.var = ( (4 > 5) | ( 4 > 6) ) & ( (3 < 5) | (3 > 5) )

my.var

# SLIDE 27

my_int = as.integer(5)

is.integer(my_int)  # These are good for use in programming loops

is.numeric(my_int)

is.character(my_int)

is.logical(my_int)

# SLIDE 28

my_int = as.integer(5)

as.character(my_int)

as.integer(as.character(my_int))  

my_number = 12.345

as.character(my_number)

as.logical(1)

as.character(as.logical(1))

# SLIDE 29

my.func = function(x) {

       if (!is.numeric(x) ) {
          stop(“Hey. I need a numeric vector here”)
       } else {
          return(mean(x))
       }
}

# SLIDE 30

y = 5.4     # A single assignment

y = 1:10    # A vector with 10 elements (1 .. 10) 

y = c(1,2,3,4,5,6,7,8,9,10) # Same as above yet using the “c” function

y = scan()   # Allows you to enter in elements from the keyboard

# SLIDE 31


height = c(59,70,66,72,62,66,60,60)	# create a vector of 8 heights

height[1:5]			# Get first 5 elements


height[5:1]			# Get first 5 elements in reverse

height[-1]			# Get all but first element

height[-1:-2]			# Get all but first two elements

height[c(1,5)]			# Get just first and fifth elements

# SLIDE 32

height

height == 72		# Test for values equal to 72

height[height == 72]

# SAME AS 

logical.vector = height > 60

height[logical.vector]

# SLIDE 33

height = c(59,70,66,72,62,66,60,60)	# create a vector of 8 heights

height[height > 60 & height < 70] # Note use of the "&" / and operator
 
height[height > 60 & height <= 70]  

# SLIDE 34

height[height > 60 & height < 70] 


# OR:

for (ii in 1:length(height)) {
    if (height[ii] > 60 & height[ii] < 70) {
       print(height[ii])
   }
}

# SLIDE 35

weight = c(117,165,139,142,126,151,120,166)   # weight (in lbs)

weight/100

sqrt(weight)

weight^2

sum((weight-mean(weight))^2)/(length(weight)-1)  # The variance formula

var(weight)


# SLIDE 36

weight = c(117,165,139,142,126,151,120,166)   # weight (in lbs)

new.weights = weights + 1		# Vector Addition

new.weights

append(weights,new.weights)	# Combines the two vectors 

c(weight,new.weights)             # Equivalent to the above

weight/new.weights		# Vector division

# SLIDE 37

gender = c("F","M","F","M","F","M","F","M")  # Get their gender

smoker = c("N","N","Y","Y","Y","N","N","N")  # Do they smoke ?

table(gender,smoker)	# Let's count them

prop.table(table(gender,smoker))

library(lattice)

barchart(table(gender,smoker),auto.key=TRUE,main="Smoking M/F")

# SLIDE 39

y = 1:10

length(y)  # Length of the entire vector

sapply(y,length)        # Returns the length of each element

vec1 = 1:5

vec2 = c(1,3)

vec1 + vec2       # The shorter vector (vec2) is recycled

# SLIDE 40

( my.counts = c(25,67,99,11,45,76) )

names(my.counts)

names(my.counts) = 0:5

names(my.counts)

names(my.counts) = LETTERS[1:6]  # LETTERS is predefined in R

names(my.counts)

# SLIDE 41

height = c(59,70,66,72,62,66,60,60)

# Let's also create a character vector that contains the names of people 
# whose heights we measured

my.names = c("Jacqueline","Frank","Babette",
             "Mario","Adriana","Esteban","Carole","Louis")

names(height) = my.names
height

# SLIDE 42

new.names = paste("ID",1:8,sep="_")

new.names

names(height) = new.names
 
# SLIDE 43

which(height > 60)
  
# Note that the element names do not interfere with numeric evaluations

mean(height)  

# SLIDE 44

gender = c("F","M","F","M","F","M","F","M")  # Get their gender

smoker = c("N","N","Y","Y","Y","N","N","N")  # Do they smoke ?

length(gender)		# Gives current length of vector

length(gender) = 10	# Sets length of the vector

gender			# NA represents a missing value

# SLIDE 45

is.na(gender)

which(is.na(gender))	# Which elements contain missing values

which(!is.na(x)) 		# Which elements don’t have missing values

gender[!is.na(gender)]	# Get elements which aren't missing

gender[9:10] = "-"	# Set all Nas to "-"

# SLIDE 48

mean(height)		# Get the mean	

sd(height)		# Get standard deviation

min(height)		# Get the minimum

range(height)		# Get the range

fivenum(height)		# Tukey's summary (minimum, lower-hinge, median, 				  upper-hinge, maximum)

length(height)		# Vector length

quantile(height)		# Quantiles

# SLIDE 49

my.vals = rnorm(10000,20,2)

max(my.vals)


which.max(my.vals)


my.vals[ which.max(my.vals) ]


min(my.vals)

my.vals[ which.min(my.vals) ]

x = 1:16

x[x %% 2 == 0]                 # Find all the odd numbers from 1 to 16

# SLIDE 50

x = 0:10

sum( x[x<5] )

x[x<5]         # The sum command adds up all these numbers

# SLIDE 51

x = c(20,22,4,27,9,7,5,19,9,12)

sort(x)

rev(sort(x))

rev(sort(x))[1:3]

sum(rev(sort(x))[1:3])

# SLIDE 52

height = c(59,70,66,72,62,66,60,60)

weight = c(117,165,139,142,126,151,120,166)  # Get 8 weight measurements

cor(height,weight)			# Are they correlated ?

plot(weight,height,main="Height & Weight Plot")  # Do a X/Y plot

res = lm(height ~ weight)		# Do a linear regression

abline(res)			# Check out the regression line


# SLIDE 54

( set1 = letters[1:5] )

( set2 = letters[4:7] )

union(set1,set2)

intersect(set1,set2)

setdiff(set1,set2)

setdiff(set2,set1)

setequal("set1 %in% set2","set2 %in% set1")

# SLIDE 56

1:10

10:1

x = seq(-2, 2, by=.5)

x

s5 = rep(x, times=5)  # Makes 5 copies of x end to end

s6 = rep(x, each=5)   # Makes 5 copies of each element

# SLIDE 57

my.data = rnorm(1000,10,5)

range(my.data)

breaks=seq(-5,27,2)

hist(my.data,breaks=breaks)

# SLIDE 58

my.data = rnorm(1000,10,5)

breaks=seq(-5,27,0.5)

hist(my.data,breaks=breaks)

# SLIDE 59

my.vec = rnorm(100,10,5)

index.seq = seq(20,length(my.vec),20)

my.vec[ index.seq ]

# SLIDE 60

LETTERS		# A built-in character vector with the alphabet

sample(LETTERS)

sample(LETTERS,replace=TRUE)

sample(LETTERS,8,replace=FALSE)

# SLIDE 61

my.coins = c("Heads","Tails")		# Create a coin vector
 
sample(my.coins,5,replace=TRUE)		# 5 coin tosses

my.vec = sample(my.coins,100,replace=TRUE)

my.heads = my.vec[my.vec == "Heads"] # Gives us all the Heads

length(my.heads) / length(my.vec) * 100  # gives percentage of Heads

# SLIDE 62

my.coins = c("Heads","Tails")		# Create a coin vector
 

# LET'S SIMULATE 1,000,000 TOSSES AND TABULATE 

table(sample(my.coins,1000000,replace=TRUE))


# NOW LET'S CHEAT AND RIG THE COIN

table(sample(my.coins,1000000,replace=TRUE,prob=c(.75,.25)))


# SLIDE 63

my.norm = rnorm(1000,10)  

# Sample with replacement, collect means

mean(sample(my.norm,replace=TRUE)) 
[1] 10.01396

mean(sample(my.norm,replace=TRUE)) 
[1] 9.963395


mean(sample(my.norm,replace=TRUE)) 

#Do this 1,000 times then do quantile of all the means according 
#to .95 confidence 

# SLIDE 64

# LET'S DO A SIMPLE BOOTSTRAP EXAMPLE

my.norm = rnorm(1000,10)  # Generate 1,000 values from a normal dist, mu=10

# NOW USE THE REPLICATE FUNCTION TO GENERATE 1,000 MEANS

quantile(replicate(1000, mean(sample(my.norm, replace = TRUE))),
          probs = c(0.025, 0.975))
      

# COMPARE TO T.TEST

t.test(my.norm)$conf.int

# SLIDE 65

# LET'S ROLL A SINGLE DICE 150 TIMES. IS IT FAIR ?

dice = 1:6

table(sample(dice,150,replace=TRUE))

chisq.test(table(sample(dice,150,replace=TRUE)),p=c(1,1,1,1,1,1)/6)

# IT WOULD SEEM SO

# SLIDE 66

# LET'S ROLL A SINGLE DICE 150 TIMES. IS IT FAIR ?
# LET'S WEIGHT THE DICE

dice.table = 
table(sample(dice,150,replace=TRUE,prob=c(.16,.16,.16,.16,.16,.2)))

chisq.test(dice.table,p=c(1,1,1,1,1,1)/6)

# HMMM. SOMETHING MIGHT BE FISHY

# SLIDE 67

cards = paste(rep(c("Ace",2:10,"Jack","Queen","King"),4),
        c("Hearts","Diamonds","Spades","Clubs"),sep="_of_")

# Deal 5 cards. Make sure you don't deal the same card twice

sample(cards,5,replace=FALSE)

# SLIDE 68

cards = paste(rep(c("Ace",2:10,"Jack","Queen","King"),4),
        c("Hearts","Diamonds","Spades","Clubs"),sep="_of_")

# Deal 5 cards. Make sure you don't deal the same card twice

sample(cards,5,replace=FALSE)

# SLIDE 70

s1 = "I'm a string"

s2 = "I'm a string"

s1; s2

s1 == s2

identical(s1,s2)

compStr = function(x,y) identical(x,y)

s3 = "I'm a string too"

compStr(s1,s3)

# SLIDE 71


s1 = "I'm a string"

s2 = "I'm another string"

s1 = c(s1,s2)

s1

# SLIDE 72

dna = c("A","A","C","G","A","C","C","C","G","G","A","T","G","A","C","T","G", "A","A","C")

dna
 [1] "A" "A" "C" "G" "A" "C" "C" "C" "G" "G" "A" "T" "G" "A" "C" "T" "G" "A" "A" "C"

my.str = paste(dna,collapse="")

length(my.str)

my.str

rev(my.str)               # What's going on ? 


# SLIDE 73

nchar(my.str)
[1] 20

for (ii in 1:nchar(my.str)) {
    cat(substr(my.str,ii,ii))
}
AACGACCCGGATGACTGAAC


for (ii in nchar(my.str):1) {
    cat(substr(my.str,ii,ii))
}
CAAGTCAGTAGGCCCAGCAA

unlist(strsplit(my.str,""))
 
# SLIDE 74

my.str

substr(my.str,2,8)

substr(my.str,2,8) = "TTTTTTT"

my.str

# SLIDE 75

dna = c("A","A","C","G","A","C","C","C","G","G","A","T","G","A","C","T","G", "A","A","C")

dna
"A" "A" "C" "G" "A" "C" "C" "C" "G" "G" "A" "T" "G" "A" "C" "T" "G" "A" "A"
"C"

grep("G",dna)          # Extracts the elements numbers

dna[ grep("G",dna) ]

grep("G",dna, value = TRUE)

length(grep("G",dna, value = TRUE))  # 5 occurrences of G

# SLIDE 76

set.seed(188)

dna = sample(c("A","C","G","T"),20,T)

grep("C",dna, value = TRUE)

length(grep("C",dna))

# SLIDE 77

char.vec = c("here","we","are","now","in","winter")

nchar(char.vec)
[1] 4 2 3 3 2 6

# Remove the first element

( char.vec = char.vec[-1] )

( char.vec = c(char.vec,"Its cold") )

# SLIDE 78

char.vec = c("here","we","are","now","in","winter")

nchar(char.vec)

grep("ar",char.vec)

char.vec[3]

char.vec[ grep("ar",char.vec) ]

grep("zz",char.vec)    # Nothing returned

# SLIDE 79

char.vec = c("here","we","are","now","in","winter")

grep("^w",char.vec)

char.vec[ grep("^w",char.vec) ]    # Words that begin with “w”

grep("w",char.vec)                 # Any words that contain w

char.vec[ grep("w",char.vec) ]

grep("w$",char.vec)              # words that end with “w”

char.vec[4]

# SLIDE 80


url = "http://www.bimcore.emory.edu/BIOS560/DATA.DIR/worldfloras.txt"

my.df = read.csv(url,header=T,sep="\t")

nations = as.character(my.df$Country)

head(nations,4)  

tail(nations,4)

grep("R",nations)

nations[ grep("R",nations) ]

# SLIDE 83

nations[ grep("^R",nations) ]

nations[ grep(" R",nations) ]

nations[ grep(" ",nations) ]

# SLIDE 85

nations[ grep("[C-E]",nations) ]  # All countries that contain uppercase C,D,E

nations[ grep("^[C-E]",nations) ] # All countries beginning with C,D,E

# SLIDE 86


nations[ -grep("[a-t]$",nations) ]

nations[ -grep("[A-T a-t]$",nations) ]

# Find all country names that end in "y" and are preceeded by 
# exactly 5 characters

grep("^.....y$", nations,value=T)

# SLIDE 86

text = c("arm","leg","head","foot","hand","hindleg","elbow")        

gsub("h","H",text)

gsub("o","O",text)

gsub("^.","O",text)

# SLIDE 89


newtext = "thisis $ a test $. It is / <indeed>"        

gsub("$","",newtext)

gsub("\\$","",newtext)

gsub(".","T",newtext)

gsub("\\.","T",newtext)

gsub("<","K",newtext)

gsub("<|>","K",newtext)

# SLIDE 90

ctl = c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt = c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group = gl(2,10,20, labels=c("Ctl","Trt"))
weight = c(ctl, trt)
lm.D9 = lm(weight ~ group)

names(lm.D9)

lm.D9$coefficients

lm.D9$coefficients[[1]]

# SLIDE 91

typeof(lm.D9)
[1] "list"

for (ii in 1:length(lm.D9)) {
    print(typeof(lm.D9[[ii]]))
}

sapply(lm.D9, typeof)

# SLIDE 92

lapply(lm.D9, typeof)

# SLIDE 93

my.string = “This is a test”

my.s = strsplit(my.string, " ")

typeof(my.s)

my.s

my.s[1]

my.s[[1]]

typeof(my.s[[1]])

# SLIDE 94

my.string = “This is a test”

my.s = strsplit(my.string, " ")

typeof(my.s)

my.s[[1]][1:2]
 
my.s[[1]][3:1]

length(my.s)

length(my.s[1])

length(my.s[[1]])

# SLIDE 95

names(my.s) = "string_a"

my.s

my.s['string_a']

my.s[['string_a']]

my.s[['string_a']][1]

my.s[['string_a']][3]

my.s[['string_a']][2:4]

# SLIDE 96

Family = list(husband="Fred", wife="Wilma", num.of.children=3, 
   child.ages=c(4,7,9))

length(Family)	# number of top level elements

Family[[2]]

# SLIDE 97

str(Family)

names(Family)

Family[['wife']]

Family$wife

# SLIDE 98

Family = list(husband="Fred", wife="Wilma", num.of.children=3, 
   child.ages=c(4,7,9))

my.names = names(Family)

my.names

my.names[4] = "ages"  

my.names

names(Family) = my.names     

names(Family)
        
Family$ages

# SLIDE 99

Family = list(husband="Fred", wife="Wilma", num.of.children=3, 
   child.ages=c(4,7,9))

Family[[4]][1]

Family[[4]][1:3]

Family$child.age[1]

Family$child.age[1:3]

# SLIDE 100

Family[c(1,4)]   # Get 1st and 4th elements

# SLIDE 101

Family


# SLIDE 102

unlist(Family)
 
as.numeric(unlist(Family))

# SLIDE 103

for(ii in 1:length(Family)) {
    print(Family[ii])
}

# SLIDE 104

my.summary <- function(x) {
	return.list = list()       # Declare the list

	return.list$mean = mean(x)
	return.list$sd = sd(x)
	return.list$var = var(x)

	return(return.list)   
}

my.summary(1:10)

names(my.summary(1:10))

# SLIDE 105

lapply(Family, class)

unlist(lapply(Family, class))


# SLIDE 106

lapply(Family, mean)


# SLIDE 107


my.func <- function(x) {
  if(class(x)=="numeric") {
    return(mean(x))
  }
}


lapply(Family, my.fun)

# SLIDE 108

for (ii in 1:length(Family)) {
   if (class(Family[[ii]]) == "numeric") {
      print(mean(Family[[ii]]))
    }
}


# SLIDE 109

lapply

# SLIDE 110

Geneology = list()	# Initialize a blank list

Geneology[[1]] = Family

Geneology[[2]] = list(husband="Louis", wife="Sue", 
                      num.of.children=2, child.ages=c(3,5))

Geneology[[3]] = list(husband="Barney",wife="Betty",
                      num.of.children=1,child.ages=c(4))

length(Geneology)

Geneology[[1]]$child.ages


# SLIDE 111

Geneology[[3]]

names(Geneology)

names(Geneology) = c("F1","F2","F3")  -OR-

names(Geneology) = paste("F",1:3,sep="")  # For generality

# SLIDE 112

names(Geneology) = c("F1","F2","F3")  -OR-

names(Geneology) = paste("F",1:3,sep="")  # For generality

names(Geneology)

Geneology[['F3']]$wife

Geneology$F3$wife


# SLIDE 113

tot1 = 0
tot2 = 0

for (ii in 1:length(Geneology)) {
    tot1 = tot1 + sum(Geneology[[ii]]$child.ages)
    tot2 = tot2 + length(Geneology[[ii]]$child.ages)
}

avg.child.age = tot1/tot2

avg.child.age

# SLIDE 114

my.list = lapply(Geneology,function(x) return(x$child.ages))

my.list

# Check out the unlist command. It gives a vector we can easily work with
 
unlist(my.list)


sum(unlist(my.list)/length(unlist(my.list)))

# SLIDE 115

my.mat = sapply(Geneology,function(x) {
                  c(sum(x$child.ages),sum(length(x$child.ages)))
           })

my.mat
    
sum(my.mat[1,])/sum(my.mat[2,])

# SLIDE 117

wins = list(Adelaide = c(1997, 1998),
 Carlton = c(1906,1907,1908, 1914, 1915, 1938, 1945, 1947, 1968,1970, 1972,1979,1981,1982,1987,1995),
  Collingwood = c(1902, 1903, 1910, 1917,1919,1927,1928,1929,1930,1935,1936,1953,1958,1990))

str(wins)

1915 %in% wins$Adelaide

1915 %in% wins$Carlton

1915 %in% wins$Collingwood

# SLIDE 118

year = 1915
for (i in 1:length(wins)) {
   if (year %in% wins[[i]]) {
    winner = names(wins)[i]
   }
}

winner

my.func = function(x) {
   club = 1915 %in% x
   return(club)
}

sapply(wins,my.func)
   Adelaide     Carlton Collingwood 
      FALSE        TRUE       FALSE 

(wins)[sapply(wins,my.func)]

# SLIDE 119

library(twitteR)

delta.tweets = searchTwitter('@delta', n = 1500)

head(delta.tweets)

# SLIDE 120

delta.text = unlist(lapply(delta.tweets,function(x) x$getText())

# SLIDE 121

for (i in 1:length(delta.text)){ 
    delta.text[i] = gsub("[[:cntrl:]]","",delta.text[i])
    delta.text[i] = gsub("[[:punct:]]","",delta.text[i])
    delta.text[i] = gsub("\\d+","",delta.text[i])
}

head(delta.text)

# SLIDE 122


my.func <- function(process.text) {
process.text = gsub("[[:cntrl:]]","",process.text)
process.text = gsub("[[:punct:]]","",process.text)
process.text = gsub("\\d+","",process.text)
return(process.text)
}

delta.text = unlist(lapply(delta.text,my.func))

head(delta.text)

# SLIDE 124

myvec = c(1:12)

dim(myvec) = c(3,4)

myvec

# SLIDE 125

mymat = matrix( c(7, 4, 2, 4, 7, 2), nrow=3, ncol=2) 
mymat

# SLIDE 126

a1 = c(4,5,7,9)
a2 = c(9,1,4,3)
a3 = c(4,8,6,7)  

mymat = matrix(c(a1,a2,a3),4,3)

# SLIDE 127

X = matrix(rpois(20,1.5),nrow=4)
X

# SLIDE 128

colnames(X) = colnames(X,do.NULL=FALSE,prefix="P.")
 
X

# SLIDE 129

drug.names = c("aspirin","paracetamol","nurofen","hedex","placebo")

colnames(X) = drug.names

X

# SLIDE 130

set.seed(123)

X = matrix(rpois(9,1.5),nrow=3)

X


# SLIDE 131

X
    
X[1:2,1]     # Gets First and second rows and the first column

X[1:2,2]     # Gets First and second rows and the second column

X[1:2,]      # Gets First and second rows and ALL columns
    
# SLIDE 132

X

X[,c(1,3)]     # Get all rows but only columns 1 and 3

X[,-2]   # Same effect as above. Get all rows and columns except 2
     
# SLIDE 133

set.seed(123)

X = matrix(rpois(9,1.5),nrow=3)

X
     
rownames(X) = rownames(X,do.NULL=FALSE,prefix="Trial.")

drug.names = c("aspirin","paracetamol","nurofen")

colnames(X) = drug.names

X

# SLIDE 134

X

X['Trial.1',]        # Get all columns for Trial.1

X['Trial.1','nurofen']    # Get the nurofen column for Trial.1

X[,'nurofen']            # Get all Trials for nurofen


X[,'nurofen',drop=FALSE]   # Preserves matrix structure if desired
       
# SLIDE 135

X
    
X[1:4]

X >= 2
      
sapply(X, function(x) x >= 2)

X[X >= 2]

# SLIDE 136

X
    
X %% 2 == 0          # Returns a logical matrix
     
X[ X %% 2 == 0 ]   # Finds the actual element values

# SLIDE 137

X
    

X[X %%  2 == 0] = 9

X

# SLIDE 138

set.seed(123) 

X = matrix(rpois(9,1.5),nrow=3)

colnames(X) = c("aspirin","paracetamol","nurofen")

rownames(X) = paste("Trial",1:3,sep=".")

X

mean(X[,3])  # Mean of the 3rd column

var(X[3,]) # Variance of the 3rd row

# SLIDE 139

X

rowSums(X)

colSums(X)

# SLIDE 140

rowMeans(X)
  
colMeans(X)
   
colMeans(X)[3]
 
# SLIDE 141

X[1,2] = NA

X
       
colMeans(X)
    
colMeans(X, na.rm=TRUE)
   
# SLIDE 142

X
       
apply(X,1,summary)                # 1 is for rows
        
apply(X,2,summary)                 # 2 is for columns
        

# SLIDE 143

set.seed(123) 

X = matrix(rpois(9,1.5),nrow=3)

colnames(X) = c("aspirin","paracetamol","nurofen")

rownames(X) = paste("Trial",1:3,sep=".")

X

group=c("A","B","B")    # Considers Row 1 to be in A group
                       # Considers Rows 2 and 3 to be in B group
rowsum(X,group)  
  

# SLIDE 144

X

sample(X)   # Samples 9 elements without replacement

matrix(sample(X),3,3) # We create a variation on the previous matrix
     
apply(X,2,sample)  # This is easier as it maintains the structure
     
# SLIDE 146

X
         
rbind(X,Trial.4=c(4,7,5))
        
# SLIDE 147

X
        
hold = c(9,4,3,5,4,6,8,7,6)    # We have entries for 3 new rows

dim(hold)=c(3,3)               # Make a new matrix

my.mat = rbind(X,hold)         # Bind the old to the new

my.mat                         # What happened to the rownames ?
        
# SLIDE 148

my.mat                         # What happened to the rownames ?
         
rownames(my.mat) = paste("Trial.",1:nrow(my.mat),sep="")

my.mat
        
# SLIDE 150

set.seed(123)

X = round(matrix(rnorm(20,10,1),nr=5,nc=4), 2)

X
      
colMeans(X)

9.44 - 10.194

# SLIDE 151

9.44 - 10.194

cols = colMeans(X)

cols

sweep(X,2,cols,"-")

# SLIDE 152

sums = colSums(X)

sums

sweep(X,2,sums,"/")      # 2 indicate columns

colSums(sweep(X,2,sums,"/"))  # Verifies that all columns sum to 1

# SLIDE 153

set.seed(123)

X = round(matrix(rnorm(20,10,1),nr=5,nc=4), 2)

temp = X

rows = nrow(X)
for (jj in 1:nrow(temp)) {
   for (kk in 1:ncol(temp)) {
      temp[jj,kk] = X[jj,kk]/sum(X[1:rows,kk])
   }
}

# SLIDE 154

set.seed(123)

X = round(matrix(rnorm(20,10,1),nr=5,nc=4), 2)

temp = X

rows = nrow(X)
for (jj in 1:nrow(temp)) {
   for (kk in 1:ncol(temp)) {
      temp[jj,kk] = X[jj,kk]/sum(X[1:rows,kk])
   }
}

> temp
       
# SLIDE 155

temp = X

rows = nrow(X)                 # Get number of rows in X

for (jj in 1:nrow(temp)) {
   for (kk in 1:ncol(temp)) {
      temp[jj,kk] = X[jj,kk]/sum(X[1:rows,kk])
   }
}

# SLIDE 156

A = matrix(c(1,3,2,2,8,9),3,2)
A
    
7 * A
     
t(A)

# SLIDE 158

A

a = c(5,8)

A %*% a
    

A * a
     

# SLIDE 159

A
     
B = matrix(c(5,8,4,2),2,2)

A %*% B

# SLIDE 160

B

diag(B)             # Fetches the diagonal


diag(c(1,2,3))      # Creates a matrix with 1,2,3 on the diagonal
    
diag(1,4)           # Creates a 4 x 4 Indentity matrix
     
# SLIDE 161

A = matrix(1:4,2,2)

A
     
B = solve(A)

B
     
A %*% B
     

# SLIDE 162

A
     
b = c(7,10)

x = solve(A) %*% b

x
     
# SLIDE 163

my.wines = read.csv("http://www.bimcore.emory.edu/wine.csv",header=T)

my.scaled.wines = scale(my.wines)   # Scale the data

my.cov = cov(my.scaled.wines)       # Get the covariance matrix

my.eigen = eigen(my.cov)            # Now find the eigen values/vectors

options(digits=3)                 

my.eigen 

# SLIDE 164

loadings = my.eigen$vectors  

scores = my.scaled.wines %*% loadings 

# SLIDE 181

smoking.answer = c(1,0,0,0,1,0,0,0,1,0,0,1,0)

table(smoking.answer)

factor(smoking.answer, levels = c(0,1), labels=c("NO","YES"))
 
factor(smoking.answer, levels = c(1,0), labels=c("NO","YES"))

table(factor(smoking.answer, levels = c(0,1), labels=c("NO","YES")))

# SLIDE 183

cut(0:10,breaks=4)
 
table(cut(0:10,breaks=4))

# SLIDE 184

( my.cut = cut(0:10,breaks=4,labels=c("Q1","Q2","Q3","Q4")) )
 
table(my.cut)
my.cut

# SLIDE 185

quantile(0:10)
  
table(cut(0:10,breaks=quantile(0:10),include.lowest=TRUE))

# SLIDE 186

exam.score = runif(25,50,100)

cut(exam.score,breaks=c(50,60,70,80,90,100))
 
cut(exam.score,breaks=c(50,60,70,80,90,100),labels=c("F","D","C","B","A"))
 
my.table = table(cut(exam.score,breaks=c(50,60,70,80,90,100),labels=c("F","D","C","B","A")))

barchart(my.table,main="Grade BarChart",col=terrain.colors(5))

# SLIDE 188

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
acount bcount ccount dcount fcount

# SLIDE 189

mons =c("Jan","Feb","Mar","Apr","May","Jun","Jan","Feb",
          "May","Jun", "Apr","Mar")

my.fact.mons = factor(mons)
 
my.fact.mons[1] < my.fact.mons[2]


# SLIDE 192

fresh = round(runif(5),2)

soph  = round(runif(5),2)

junrs = round(runif(5),2)

fresh                          # Note that our 1st freshman is very
                               # confident !!
soph

junrs

# SLIDE 193

( my.stack = stack(list(fresh=fresh,soph=soph,junrs=junrs)) )

# SLIDE 194

bwplot(~values|ind,my.stack,layout=c(1,3))





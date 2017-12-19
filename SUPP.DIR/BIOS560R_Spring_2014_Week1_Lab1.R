# SLIDE 04
head(mtcars,15)

# SLIDE 06

xyplot(mpg~1:nrow(mtcars)|factor(cyl),data=mtcars)
aggregate(mpg~cyl,data=mtcars,mean)

# SLIDE 07

3+5 
typeof(3)
class(3) # “class” and “mode” can be used interchangeably [1] "numeric"
typeof(`+`)
str(3) num 3

# SLIDE 08
￼
var1 = 3
var1
sqrt(var1)
var1 = 33.3
str(var1)

#SLIDE 09
￼
myvar = 5
myvar + myvar
myvar - myvar
myvar * myvar
myvar / myvar
myvar ^ myvar

# SLIDE 10 
￼
class(aa)
str(aa) num 5
aa = as.integer(aa) # We use a "coercion" function here class(aa)
aa = 5.67
as.integer(aa)   # Truncates the value - note it doesn’t round.

#SLIDE 11
￼
var.one = "Hello there ! My name is Steve."
var.two = "How do you do ?"
var.one
nchar(var.one) # Number of characters present [1] 31
toupper(var.one)
mydna = c("A","G","T","C","A")

# See BioConductor http://www.bioconductor.org/

str(mydna)

mydna

#SLIDE 12
￼
paste(var.one,var.two)
paste(var.one,var.two,sep=":")
strsplit(var.one," ")
patientid = "ID:011472:M:C"  # Encodes Birthday, Gender, and Race
strsplit(patientid,":")
bday = strsplit(patientid,":")[[1]][2]  # Get just the birthday

#SLIDE 13
￼
Sys.Date()
Sys.Date()+1
class(Sys.Date())
string = "2011-04-27”
class(string)
as.Date(string)

#SLIDE 14
￼
as.Date("03/17/1996")
as.Date("03/17/1996",format="%m/%d/%Y")
as.Date('1/15/2001',format='%m/%d/%Y')
as.Date('April 26, 2001',format='%B %d, %Y')
as.Date("2012-10-27") 

#SLIDE 15
￼
my.date = as.Date("2012-10-27")
my.date - 1
format(my.date,"%Y")
format(my.date,"%b")
format(my.date,"%y")
# Note all of these are character strings
￼format(my.date,"%b %d")
format(my.date,"%b %d, %Y")

#SLIDE 16
￼
difftime("2005-10-21 08:32:58","2003-8-15 09:18:05")
strptime(c("03/27/2003","03/27/2003","04/14/2008"),format="%m/%d/%Y")

#SLIDE 17
# Note that rdates has been prefilled - ￼
￼￼￼￼rdates
   Release       Date
1      1.0 2000-02-29
2      1.1 2000-06-15
3      1.2 2000-12-15
4      1.3 2001-06-22
5      1.4 2001-12-19
6      1.5 2002-04-29
7      1.6 2002-10-10
8      1.7 2003-04-16
9      1.8 2003-10-08
10     1.9 2004-04-12
11     2.0 2004-10-04

mean(rdates$Date)
range(rdates$Date)
rdates$Date[11] - rdates$Date[1]

#SLIDE 18

some.variable = TRUE

some.variable = (4 < 5)

if (some_logical_condition) {
   do something
}
if ( 4 < 5 ) {
  print(“Four is less than Five”)
}

#SLIDE 19
￼
if ( 4 < 5 ) {
  print("Four is less than Five")
}
my.var = ( 4 < 5)
if (my.var) {
  print("four is less than five")
}
if (! my.var ) {
   print("four is greater than five")
}
my.var=(4<5)&(4<6) #LogicalANDoperator
my.var
my.var = (4 < 5) | ( 4 < 6 ) # Logical OR operator.
my.var = TRUE

#SLIDE 21
￼
my_int = as.integer(5)
is.integer(my_int)  # These are good for use in programming loops
is.numeric(my_int)
is.character(my_int)
is.logical(my_int)

#SLIDE 22
￼
my_int = as.integer(5)
as.character(my_int)
as.integer(as.character(my_int))
my_number = 12.345
as.character(my_number)
as.logical(1)
as.character(as.logical(1))

#SLIDE 23
￼
my.func = function(x) {
   if (!is.numeric(x) ) {
         stop("Hey. I need a numeric vector here")
   } else {
         return(mean(x))
   }
}

# SLIDE 24
￼
1:10
rnorm(10)
y = 5.4     # A single assignment
y = 1:10    # A vector with 10 elements (1 .. 10)
y = c(1,2,3,4,5,6,7,8,9,10) # Same as above yet using the “c” function
y = scan()
1: 10
2:  9
3:  8
.. 1: 1
# Allows you to enter in elements from the keyboard

#SLIDE 25
￼
height = c(59,70,66,72,62,66,60,60) # create a vector of 8 heights Let’s check out the various ways we can index into the vector
height[1:5]
height[5:1]
height[-1:-2] # Get all but first two elements 
height[c(1,5)] # Get just first and fifth elements
height[-1]

#SLIDE 26

height = c(59,70,66,72,62,66,60,60) # create a vector of 8 heights
height
height == 72 # Test for values equal to 72 
height[height == 72]
# SAME AS
logical.vector = (height == 72)
logical.vector
height[ logical.vector ]

#SLIDE 27
￼
height = c(59,70,66,72,62,66,60,60) # create a vector of 8 heights
# Note use of the "&" / and operator
height[height > 60 & height < 70]
height[height > 60 & height <= 70]

#SLIDE 28

height[height > 60 & height < 70]

#OR:

for (ii in 1:length(height)) {
    if (height[ii] > 60 & height[ii] < 70) {
       print(height[ii])
   }
}

#SLIDE 29
￼
weight = c(117,165,139,142,126,151,120,166)   # weight (in lbs)
weight/100
sqrt(weight)
weight^2
sum((weight-mean(weight))^2)/(length(weight)-1)  # The variance formula
var(weight)

#SLIDE 30 
￼
height = c(59,70,66,72,62,66,60,60)
weight = c(117,165,139,142,126,151,120,166)

# Get 8 weight measurements

cor(height,weight) # Are they correlated ? 
plot(weight,height,main="Height & Weight Plot") # Do a X/Y plot 
res = lm(height ~ weight) # Do a linear regression abline(res) # Check out the regression line
abline(res)

#SLIDE 32
￼
weight = c(117,165,139,142,126,151,120,166) # weight (in lbs) 

new.weights = weights + 1 # Vector Addition
new.weights

append(weights,new.weights) # Combines the two vectors
c(weight,new.weights)             # Equivalent to the above

weight/new.weights # Vector division

#SLIDE 33
￼
gender = c("F","M","F","M","F","M","F","M") # Get their gender 

smoker = c("N","N","Y","Y","Y","N","N","N") # Do they smoke ? 

table(gender,smoker) # Let's count them

prop.table(table(gender,smoker))

library(lattice)

barchart(table(gender,smoker),auto.key=TRUE,main="Smoking M/F")

#SLIDE 34
￼
￼￼Vectors - character vectors
￼￼￼￼￼Pi$ard - wsp@emory.edu BIOS 560R
34
￼
y = 1:10

length(y)  # Length of the entire vector

vec1 = 1:5

vec2 = c(1,3)

vec1 + vec2
# The shorter vector (vec2) is recycled

#SLIDE 37
￼
height = c(59,70,66,72,62,66,60,60)
my.names = c("Jacqueline","Frank","Babette","Mario","Adriana","Esteban","Carole","Louis")
names(height) = my.names
height

#SLIDE 38
￼
height > 60

which(height > 60)

height[which(height > 60)]

# Note that the element names do not interfere with numeric evaluations
mean(height)

#SLIDE 39
￼
new.names = paste("ID",1:8,sep="_")

new.names

names(height) = new.names

height

#SLIDE 40
￼
gender = c("F","M","F","M","F","M","F","M")  # Get their gender

smoker = c("N","N","Y","Y","Y","N","N","N")  # Do they smoke ?

length(gender) # Gives current length of vector [1] 8

length(gender) = 10 # Sets length of the vector gender # NA represents a missing value

#SLIDE 41

is.na(gender)

which(is.na(gender)) # Which elements contain missing values [1] 910

which(!is.na(x)) # Which elements don’t have missing values [1] 1 2 3 4 5 6 7 8

gender[!is.na(gender)] # Get elements which aren't missing [1] "F" "M" "F" "M" "F" "M" "F" "M"

gender[9:10] = "-" # Set all Nas to "-" but probably should leave NAs [1] "F" "M" "F" "M" "F" "M" "F" "M" "-" "-"

#SLIDE 42
￼
set.seed(123)
x = rnorm(10)

sum()
prod(x)     
cumsum(x)  
cumprod(x)
min(x)
mean(x)
var(x)
cov(x,y)
range(x)
quantile(x)
fivenum(x)
max(x)
median(x)
sd(x)
cor(x,y)
length(x) 
unique(x) 
rev(x) 
sort(x) 

#SLIDE 44
￼
￼
height = c(59,70,66,72,62,66,60,60)

mean(height) 

sd(height) 

min(height)

range(height)

fivenum(height)

length(height)

quantile(height)


#SLIDE 45
￼
my.vals = rnorm(10000,20,2)

max(my.vals)

which.max(my.vals)

my.vals[ which.max(my.vals) ]

min(my.vals)

my.vals[ which.min(my.vals) ]

x = 1:16

x[x %% 2 == 0]
# Find all the odd numbers from 1 to 16

#SLIDE 46
￼
x = 0:10

x[ x < 5 ]

sum( x[x<5] )

#SLIDE 47
￼
x = c(20,22,4,27,9,7,5,19,9,12)

sort(x)

rev(sort(x))

rev(sort(x))[1:3]

sum(rev(sort(x))[1:3])

#SLIDE 48
￼
LETTERS # A built-in character vector with the alphabet

sample(LETTERS, 26, replace=F)

sample(LETTERS, 26, replace=TRUE)

sample(LETTERS,8,replace=FALSE)

#SLIDE 49 
￼
my.coins = c("Heads","Tails") # Create a coin vector sample(my.coins,5,replace=TRUE) # 5 coin tosses

my.vec = sample(my.coins,100,replace=TRUE)

my.vec

table(my.vec)

my.vec

my.heads = my.vec[my.vec == "Heads"] # Gives us all the Heads length(my.heads) / length(my.vec) * 100 # gives percentage of Heads

#SLIDE 50 
￼
my.coins = c("Heads","Tails") # Create a coin vector

# LET'S SIMULATE 1,000,000 TOSSES AND TABULATE

faircoin = table(sample(my.coins,1000000,replace=TRUE))

# NOW LET'S CHEAT AND RIG THE COIN

unfaircoin = table(sample(my.coins,1000000,replace=TRUE,prob=c(.75,.25)))
unfaircoin

#SLIDE 51
￼
chisq.test(faircoin, p=c(.5,.5))

chisq.test(unfaircoin, p=c(.5,.5))

#SLIDE 52
my.norm = rnorm(1000,10)

# Sample with replacement, collect means

mean(sample(my.norm,replace=TRUE))

mean(sample(my.norm,replace=TRUE))
# And so on .. ..

mean(sample(my.norm,replace=TRUE))
# Do this 1,000 times then do quantile of all the means according to .95 confidence

#SLIDE 53
my.norm = rnorm(1000,10)  # Generate 1,000 values from a normal dist, mu=10

# NOW USE THE REPLICATE FUNCTION TO GENERATE 1,000 MEANS

quantile(replicate(1000, mean(sample(my.norm, replace = TRUE))),
+          probs = c(0.025, 0.975))

# COMPARE TO T.TEST

t.test(my.norm)$conf.int

#SLIDE 54
￼
char.vec = c("here","we","are","now","in","winter")
nchar(char.vec)

rev(char.vec)   # Reverses the vector

char.vec[-1]   # Omit the first element

char.vec = c(char.vec,"Its cold")

# Append the vector

#SLIDE 55
￼
char.vec = c("here","we","are","now","in","winter")

grep("ar",char.vec)

char.vec[3]

grep("ar",char.vec,value=T)

grep("^w",char.vec,value=TRUE) # Words that begin with “w”

grep("w",char.vec, value=TRUE)                 # Any words that contain w

grep("w$",char.vec, value=TRUE)              # words that end with “w”

#SLIDE 56
￼
char.vec = c("here","we","are","now","in","winter")

char.vec[ -grep("ar",char.vec)]  # All words NOT containing "ar"

-grep("ar",char.vec)

char.vec[-3]

gsub("here","there",char.vec)  # We can change words too !

gsub("^w","Z",char.vec) # Replace any "w" at the beginning of a word to Z

#SLIDE 57
￼
dna = c("A","A","C","G","A","C","C","C","G","G","A","T","G","A","C","T","G","A","A","C")

dna

grep("G",dna) # Extracts the elements numbers [1] 4 9101317

dna[ grep("G",dna) ]

#OR MORE SIMPLY

grep("G",dna, value = TRUE)

length(grep("G",dna, value = TRUE))  # 5 occurrences of G

#SLIDE 58
￼
set.seed(188)

dna = sample(c("A","C","G","T"),20,T)

dna

grep("C",dna, value = TRUE)

length(grep("C",dna, value=T))

#SLIDE 59
￼
dna = c("A","A","C","G","A","C","C","C","G","G","A","T","G","A","C","T","G","A","A","C")

dna

my.str = paste(dna,collapse="")

length(my.str)

my.str

rev(my.str) # What's going on ? [1] "AACGACCCGGATGACTGAAC"

str(my.str)                  # Its now just a character string not a vector

#SLIDE 60 
￼
my.str = paste(dna,collapse="")

substr(my.str,1,1)

substr(my.str,1,2)

substr(my.str,1,3)

substr(my.str,1,4)

gsub("TG","G",my.str)

#SLIDE 61
￼
my.str

substr(my.str,2,8)

substr(my.str,2,8) = "TTTTTTT"

my.str

#SLIDE 62

nchar(my.str)

for (ii in 1:nchar(my.str)) {
    cat(substr(my.str,ii,ii))
}

for (ii in nchar(my.str):1) {
    cat(substr(my.str,ii,ii))
}

# Recipe to get the "collapsed" string back into a vector with separate elements for each letter

unlist(strsplit(my.str,""))


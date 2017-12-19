BIOS560R Spring 2014 - LAB Objects, Variables, Vectors
============================================================
***

## Working with variables



Practice 1.0) Try out the class, typeof, and str commands

```r
3

class(3)

typeof(3)

my.var = "My name is Steve"

class(my.var)

typeof(my.var)

str(my.var)  # 'str' is actually the best one of these functions to use\t

current.date = Sys.Date()

class(current.date)

str(current.date)

str(5.45 + 35.67)

str(4 > 5)
```


***

1.1) Numeric variables – remember that for the class of numeric r let's coerce and 
interrogate between integers and floating variables:

```r

as.integer(5.67)

is.integer(5.67)

is.integer(as.integer(5.67))

str(as.integer(5.67))
```

***

1.2) Here we can take a character value and turn it into a numeric:

```r
as.numeric("5.78") + 1
```

***

1.3) BUT BE CAREFUL TO DO THE CONVERSION BEFORE YOU TRY TO USE IT IN A CALCULATION:

```r
"5.78" + 1
```


*** 

Problem 2.0) Character variables are created by using quotation marks. these types of 
variables usually wind up being labels or factors. there are a number of functions that 
we can use to get meta information:


```r

my.string = "This is a string"

nchar(my.string)

toupper(my.string)

tolower(toupper(my.string))

strsplit(my.string, " ")

paste(my.string, my.string, sep = " : ")

another.string = "Hello my name is Steve"

my.char.var = paste(my.string, another.string, sep = ". ")
```


***

2.1) Note that we can use the substr function to extract certain parts of the string. 
the next command will extract the first 10 characters. note that the "1" indicates that 
you are beginning at the 1st character.

```r
substr(my.char.var, 1, 10)

substr(my.char.var, 5, 5)
```


***


3.0) Dates - Let's check out some of the capabilities we have with dates in r. carefully 
inspect the output from the following expressions:

```r
Sys.Date()

Sys.Date() + 10
```


***

3.1) We can take character variables and turn them into true dates by using coercion. 
so if we represent the date december 12th 2012 as follows (yyyy-mm-dd)

```r
string = "2012-12-25"

as.Date(string)

class(as.Date(string))
```


***

3.2) Check this example. here we wish to coerce the date march 17th 1996 into a date. 
however, the string is mmddyyyy. 

```r
as.Date("03/17/1996")  # PRODUCES AN ERROR

as.Date("03/17/1996", format = "%m/%d/%Y")
```


***

3.3) We can pick apart the date once we have it. that is we can extract specific parts 
of it:

```r
my.date = as.Date("03/17/1996", format = "%m/%d/%Y")

format(my.date, "%Y")

format(my.date, "%b")

format(my.date, "%b %d %Y")

```


***

3.4) We can also use the sys.time() function to get both time and date:

```r
Sys.time()

Sys.time() + 20  # Add 20 seconds 

(Sys.time() + 20) > Sys.time()
```


***
	
3.5) When processing a series of dates from an excel file we can rapidly process them 
using the strptime command:


```r
my.dates = strptime(c("03/27/2003", "03/27/2003", "04/14/2008", "03/27/1958", 
    "10/31/206", "11/21/2011"), format = "%m/%d/%Y")

str(my.dates)

range(my.dates)

my.dates[1] > my.dates[4]
```

***

Problem 4) logical variables are important because they allow you to do comparisons:

```r

4 > 5

4 < 5

my.var = 4 < 5

my.var
```

***

4.1) We can combine the logical variables into compound logical expressions such 
as the following, which uses the "&" operator

```r

my.var = (4 > 5) & (4 < 5)

my.var

# BOTH EXPRESSIONS MUST BE TRUE IN ORDER FOR THE COMBINED EXPRESSION TO BE
# TRUE.

my.var = (4 < 5) & (4 < 5)

my.var
```


***

4.2) We could also use the logical "or" operator "|". in this case either expression 
could be true and the resulting combination would be true. note that (4 > 5) is false.


```r
my.var = (4 > 5) | (4 < 5)
```

***

## Working with vectors

Problem 5.1) Next up we will look at the topic of vectors. this is an important 
concept in r so please make sure to work through all of these lab exercises. 

creating some vectors. This is easy and can be done a number of ways:

```r
1:10

rnorm(10)

y = 5.4  # A single assignment

y = 1:10  # A vector with 10 elements (1 .. 10) 

y = rnorm(10)  # A vector with 10 values from the Normal distribution

y = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
```


*** 

5.2) CREATING A VECTOR TO CONTAIN HEIGHT MEASUREMENTS:

```r

height = c(59, 70, 66, 72, 62, 66, 60, 60)

# LET’S CHECK OUT THE VARIOUS WAYS WE CAN INDEX INTO THE VECTOR

height[1:5]  # Get first 5 elements

height[5:1]  # Get first 5 elements in reverse

height[-1]  # Get all but first element

height[-1:-2]  # Get all but first two elements

height[c(1, 5)]  # Get just first and fifth elements
```


***	

5.3) WE CAN APPLY LOGICAL TESTS TO A VECTOR TO FIND ELEMENTS THAT SATISFY A 
CONDITION SET


```r
height

height == 72  # Test for values equal to 72

height[height == 72]

# SAME AS

logical.vector = height > 60

height[logical.vector]
```


***

5.4) COMPARISONS CAN BE COMBINED LIKE A DATABASE QUERY:

```r
height[height > 60 & height < 70]

# NOTE USE OF THE '&' / AND OPERATOR

height[height > 60 & height <= 70]

height[height%%2 == 0]  # Find even numbers
```

***

5.5) WE CAN ALSO DO ARITHMETIC ON VECTORS

```r
weight = c(117, 165, 139, 142, 126, 151, 120, 166)

weight/100

sqrt(weight)

weight^2

sum((weight - mean(weight))^2)/(length(weight) - 1)

# THE VARIANCE FORMULA

var(weight)
```

*** 

5.6) MORE VECTOR ARITHMETIC. ALSO WE DEMONSTRATE HOW TO APPEND VECTORS

```r
weights = c(117, 165, 139, 142, 126, 151, 120, 166)

new.weights = weights + 1  # Vector Addition

new.weights

append(weights, new.weights)  # Combines the two vectors 

c(weight, new.weights)  # Equivalent to the above
```

****

5.7) WE CAN ALSO CREATE CHARACTER VECTORS

```r
gender = c("F", "M", "F", "M", "F", "M", "F", "M")

smoker = c("N", "N", "Y", "Y", "Y", "N", "N", "N")

table(gender, smoker)  # Let's count them

prop.table(table(gender, smoker))

library(lattice)

barchart(table(gender, smoker), auto.key = TRUE, main = "Smoking M/F")
```

***

5.8) NAMING VECTOR ELEMENTS IS AN IMPORTANT WAY TO KEEP TRACK OF INFORMATION.

```r
height = c(59, 70, 66, 72, 62, 66, 60, 60)

new.names = paste("ID", 1:8, sep = "_")

new.names

names(height) = new.names

my.names = c("Jacqueline", "Frank", "Babette", "Mario", "Adriana", "Esteban", 
    "Carole", "Louis")

names(height) = my.names

height

which(height > 60)

mean(height)
```

***

PRACTICE 6) MISSING VALUES. LET'S GENERATE A VECTOR AND INTRODUCE SOME MISSING VALUES:

```r
gender = c("F", "M", "F", "M", "F", "M", "F", "M")

length(gender)  # Gives current length of vector

length(gender) = 10  # Sets length of the vector

gender  # The last 2 elements are NA - missing value

is.na(gender)

# WHICH ELEMENTS CONTAIN MISSING VALUES

which(is.na(gender))

# WHICH ELEMENTS DON’T HAVE MISSING VALUES

which(!is.na(gender))

# GET ELEMENTS WHICH AREN'T MISSING

gender[!is.na(gender)]
```

***

6.1) EXPLORE SOME OF THE VECTOR FUNCTIONS AVAILABLE TO YOU:

```r

mean(height)  # Get the mean\t

sd(height)  # Get standard deviation

min(height)  # Get the minimum

range(height)  # Get the range

fivenum(height)  # Tukey's summary 

length(height)  # Vector length

quantile(height)  # Quantiles

my.vals = rnorm(10000, 20, 2)

# CREATE 10,000 VALUES FROM A NORMAL DISTRIBUTION

max(my.vals)  # Find the maximum value

which.max(my.vals)  # Find which element number it is ?

my.vals[which.max(my.vals)]
```

***

6.3) HERE IS ANOTHER VECTOR. WHAT IF WE WANTED TO COMPUTE THE SUM OF THE THREE LARGEST 
VALUES ?

```r
x = c(20, 22, 4, 27, 9, 7, 5, 19, 9, 12)

sort(x)

rev(sort(x))

rev(sort(x))[1:3]

sum(rev(sort(x))[1:3])
```

***


PRACTICE 8.0) THE SAMPLE FUNCTION PROVIDES A WAY TO RANDOMLY EXTRACT SOME NUMBER OF 
ELEMENTS FROM A VECTOR.


```r
LETTERS  # A built-in vector with the alphabet

sample(LETTERS)

sample(LETTERS, replace = TRUE)

sample(LETTERS, 8, replace = FALSE)
```

***

8.1) SAMPLING TO SIMULATE A DISTRIBUTION OF COIN TOSSES:

```r
my.coins = c("Heads", "Tails")  # Create a coin vector

sample(my.coins, 5, replace = TRUE)  # 5 coin tosses

# LET'S SIMULATE 1,000,000 TOSSES AND TABULATE

table(sample(my.coins, 1e+06, replace = TRUE))

# NOW LET'S CHEAT AND RIG THE COIN

table(sample(my.coins, 1e+06, replace = TRUE, prob = c(0.75, 0.25)))
```

***

PROBLEM 9.0) WORKING WITH CHARACTER VECTORS

```r
s1 = "I'm a string"

s2 = "I'm a string"

s1
s2

length(s1)

s1 == s2

nchar(s1)

# WE CAN PRINT OUT ITS CONTENTS A CHARACTER AT A TIME.  THIS IS NOT THE BEST
# WAY TO DO THIS BUT IS POSSIBLE

for (ii in 1:nchar(my.str)) {
    cat(substr(my.str, ii, ii))
}
```

***

9.1) LET'S LOOK AT A TRUE CHARACTER VECTOR:

```r
dna = c("A", "A", "C", "G", "A", "C", "C", "C", "G", "G", "A", "T", "G", "A", 
    "C", "T", "G", "A", "A", "C")

dna

rev(dna)  # Switch the direction

length(dna)  # Count the characters

# 'SHRINK THE VECTOR TO ONE ELEMENT

my.str = paste(dna, collapse = "")

length(my.str)  # One element !

my.str

rev(my.str)  # Same as above 

nchar(my.str)  # Still shows the correct number of characters
```

***

9.2) LET'S EXTRACT SOME CHARACTERS FROM THIS CHARACTER STRING

```r
substr(my.str, 2, 8)  #Get 8 characters starting at the 2nd

# SET THE 2nd through 8th characters to TTTTTTT

substr(my.str, 2, 8) = "TTTTTTT"
```

***

PROBLEM 10) SEARCHING FOR SUBSTRINGS. WE'LL CREATE A STRING OF SIMULATED DNA:

```r

dna = c("A", "A", "C", "G", "A", "C", "C", "C", "G", "G", "A", "T", "G", "A", 
    "C", "T", "G", "A", "A", "C")
```

***

10.1) LOCATE ALL THE G CHARACTERS AND COUNT THEM. DO THE SAME WITH C.

```r
grep("G", dna)

my.g = length(grep("G", dna))

my.c = length(grep("C", dna))
```

***

10.2) LET'S ACCOMPLISH A MORE INVOLVED EXAMPLE

```r
char.vec = c("here", "we", "are", "now", "in", "winter")

grep("ar", char.vec)

char.vec[3]

char.vec[grep("ar", char.vec)]

grep("zz", char.vec)  # Nothing returned

grep("^w", char.vec)  # Get words starting with 'w'

grep("r$", char.vec, value = T)  # Get words ending with 'r'

grep("^[h-k]", char.vec, value = T)  # Find words beginning with any of the letters in h,i,j,k
```

***

10.3) GENERATE SOME SAMPLE IDENTIFIERS

```r
numtosamp = 100
myvec = paste(sample(state.abb, numtosamp, T), sample(c(0, 1), numtosamp, T), 
    sample(c("M", "F"), numtosamp, T), sep = ":")

grep("AK", myvec)

grep("AK", myvec, value = T)

# Find all the women who do not smoke from any state.

grep("0:F", myvec)

grep("0:F", myvec, value = T)

# Find all the Males

grep("M$", myvec)

grep("M$", myvec, value = T)

# Find all the identifiers that relate to identifiers from Georgia or
# Pennsylvania.

grep("PA|GA", myvec, value = T)

# Find all the idenOfiers that relate to any state BUT Georgia:
myvec[-grep("GA", myvec)]
```

***

PROBLEM 11) SUBSTITUTING CHARACTERS

```r
text = c("arm", "leg", "head", "foot", "hand", "hindleg", "elbow")

gsub("h", "H", text)

gsub("o", "O", text)

gsub("^.", "O", text)
```


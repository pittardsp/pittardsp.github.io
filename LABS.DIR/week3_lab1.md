BIOS560R Spring 2014 - LAB Lists and Data Frames
============================================================
Pittard wsp@emory.edu
***

## Working with lists

Practice 1.0) R returns lists from many of its stat functions

```r
data(mtcars)  # Load mtcars into the environment

mylm = lm(mpg ~ wt, data = mtcars)

print(mylm)

typeof(mylm)

str(mylm)

names(mylm)

mylm$effects

my.summary <- function(x) {
    return.list = list()  # Declare the list
    
    return.list$mean = mean(x)
    return.list$sd = sd(x)
    return.list$var = var(x)
    
    return(return.list)
}
my.summary(1:10)

names(my.summary(1:10))

my.summary(1:10)$var
```


***

1.1) strsplit returns a list whose elements conain character strings


```r
mystring = "This is a test"

mys = strsplit(mystring, " ")

str(mys)

mys

mys[[1]][1]

mys[[1]][1:2]

unlist(mys)

```


***

1.2) Lists are similar to structures in other languages such as C or C++


```r
employee1 = list(id_number = 1, age = 22, salary = 12000.21)

employee2 = list(id_number = 2, age = 32, salary = 13000)

employee3 = list(id_number = 3, age = 40, salary = 90000)

emp_database = list(employee1, employee2, employee3)

# We can turn this list of lists into a data frame by using this 'recipe'

my.df = do.call(rbind, emp_database)

```


***

1.3) Let's start a family !


```r

family1 = list(husband = "Fred", wife = "Wilma", numofchildren = 3, agesofkids = c(8, 
    11, 14))

length(family1)  # Has 4 elements

family1

str(family1)

```


***

1.4) Indexing into lists can be done via element name or element number


```r
names(family1)

family1$agesofkids  # If the list elements have names then use '$' to access the element

family1$agesofkids[1:2]

# If the list elements have no names then you have to use numeric indexing

family1 = list("Fred", "Wilma", 3, c(8, 11, 14))

family1

family1[1]  # So we get back the list element number as well as the element's value

family1[[1]]  # Oh so the double bracket is more specific - we get just the element value

family1[[4]][1:2]  # With respect to the 4th element show the first two values of the vector

```


***

1.5) You can "neutralize" a list by using the unlist function


```r
unlist(family1)

as.numeric(unlist(family1))

# You can add elements to a named list by using the $ symbol

family1 = list(husband = "Fred", wife = "Wilma", numofchildren = 3, agesofkids = c(8, 
    11, 14))

family1$numofpets = 2

family1

# You can add elements to a list using a numeric index

family1 = list(husband = "Fred", wife = "Wilma", numofchildren = 3, agesofkids = c(8, 
    11, 14))

family1[5] = 2

family1

# You can delete elements by setting them to a value of NULL

family1 = list(husband = "Fred", wife = "Wilma", numofchildren = 3, agesofkids = c(8, 
    11, 14))

family1$wife = NULL

family1

# OR USE ELEMENT NUMBER IF YOU WISH

family1 = list(husband = "Fred", wife = "Wilma", numofchildren = 3, agesofkids = c(8, 
    11, 14))

family1[2] = NULL

```


***

1.6) List elements can be processed using sapply and lapply.


```r
family1 = list(husband = "Fred", wife = "Wilma", numofchildren = 3, agesofkids = c(8, 
    11, 14))

sapply(family1, class)

# This provides a pleasant and efficient alternative to using a for loop:

for (ii in 1:length(family1)) {
    cat(names(family1)[ii], " : ", class(family1[[ii]]), "\n")
}

# 

lapply(family1, class)  # Very similar to sapply but returns a list

lapply(family1, mean)

# Here we write a function that checks if the element is numeric or not

my.func <- function(x) {
    if (class(x) == "numeric") {
        return(mean(x))
    }
}

lapply(Family, my.fun)

```


***

## Working with Data frames

2.0) Most data frames are "given" to us when we read in .CSV files using read.table. We can also build a data frame out of pre-existing vectors or even lists.


```r
names = c("P1", "P2", "P3", "P4", "P5")

temp = c(98.2, 101.3, 97.2, 100.2, 98.5)

pulse = c(66, 72, 83, 85, 90)

gender = c("M", "F", "M", "M", "F")

my_df = data.frame(names, temp, pulse, gender)  # Much more flexible

my_df

# We can access columns of a data frame as if it were a list

plot(my_df$pulse ~ my_df$temp, main = "Pulse Rate", xlab = "Patient", ylab = "BPM")

# We can also access columns of a data frame as if it were a matrix

mean(my_df[, 2:3])

```


***

2.1) There are a number of functions we can use to get information about data frames

```r
rownames(mtcars)

colnames(mtcars)

head(mtcars, 10)

rownmaes(mtcars) = paste("car", 1:32, sep = "_")  # Name the rows according to a pattern

summary(mtcars)  # A generic way to get information on a data frame

```


***

2.2) The bracket notation works on data frames which should not be a surprise since a data frame
has characteristics of a vector, matrix, and list. 


```r

mtcars[, -11]

mtcars[, -3:-5]  # Print all columns except for columns 3 through 5

mtcars[, c(-3, -5)]  # Print all columns except for colums 3 AND 5

# We can also pass logical expressions into the bracket notation

mtcars[mtcars$mpg >= 30, ]

mtcars[mtcars$mpg >= 30, 2:6]

mtcars[mtcars$mpg >= 30 & mtcars$cyl < 6, ]

mtcars[mtcars$am == 0, ]

nrow(mtcars[mtcars$am == 0, ])

nrow(mtcars[mtcars$am == 1, ])

# we can even do dynamic calculations within the bracket notation

mtcars[mtcars$mpg > mean(mtcars$mpg), ]

mtcars[mtcars$mpg > quantile(mtcars$mpg)[4], ]

# And note that we could use the subset function as an alternative

subset(mtcars, mpg >= 30)  # Get all records with MPG > 30.0

subset(mtcars, mpg >= 30, select = c(mpg:drat))  # Get just columns mpg-drat

subset(mtcars, mpg >= 30 & cyl < 6)  # Get all records with MPG >=30 and cyl <6

```


***

2.3) It is a good habit to identify the potential factors within your data.


```r
str(mtcars)

sapply(mtcars, function(x) length(unique(x)))

summary(mtcars$am)  # Treats am as a numeric entity

mtcars$am = factor(mtcars$am, levels = c(0, 1), labels = c("Auto", "Man"))

# Now we get something sensible.

summary(mtcars$am)

```


***

Problem 2.4) We can bind rows and columns to a data frame


```r
data(mtcars)  # reload the mtcars data frame

myrate = c("B", "G", "G", "G", "B", "G", "G", "G", "B", "O", "B", "O", "B", 
    "B", "O", "G", "B", "G", "G", "G", "B", "G", "B", "B", "G", "B", "O", "B", 
    "B", "O", "B", "O")

mtcars = cbind(mtcars, myrate)

# We can also cut the MPG into a percentiles and attach labels to classify
# the MPG rate

data(mtcars)  # Reload a 'pure' copy of mtcars

mpgrate = cut(mtcars$mpg, breaks = quantile(mtcars$mpg), labels = c("Horrible", 
    "Bad", "OK", "Great"), include.lowest = T)

mtcars = cbind(mtcars, mpgrate)

head(mtcars)

library(lattice)

bwplot(~mpg | mpgrate, data = mtcars, layout = c(1, 4))

```


***

2.5) How do we handle missing values within data frames ?


```r
url = "http://homepages.wmich.edu/~hgv7680/data/SAS/hs0.csv"

data1 = read.table(url, header = F, sep = ",")

names(data1) = c("gender", "id", "race", "ses", "schtyp", "prgtype", "read", 
    "write", "math", "science", "socst")

head(data1, n = 3)

nrow(data1)

sum(complete.cases(data1))  # how many complete cases do we have ?

sum(!complete.cases(data1))  # how many incomplete cases do we have ?

data1[!complete.cases(data1), ]

```


***

2.6) So if we would like we can replace the missing science values by the median of the non missing science scores. Its a rather simplistic approach though.


```r
data1$science = ifelse(is.na(data1$science), median(data$science, na.rm = T), 
    data1$science)

# We could also use a linear regression approach.

cor(data1[, c(7:11)], use = "complete.obs")

(my.lm = lm(science ~ write, data1))

my.write.vals = data1[!complete.cases(data1), "write"]

my.write.vals

predict(my.lm, data.frame(write = my.write.vals), interval = "predict")

my.pred.science = predict(my.lm, data.frame(write = my.write.vals), interval = "predict")

my.pred.science[, 1]

(for.replace = which(!complete.cases(data1)))

data1[for.replace, ]$science = my.fit[, 1]

data1[for.replace, ]

```


***

3.0) Chicago Crime Data


```r

url = "http://steviep42.bitbucket.org/bios560rs2014/DATA.DIR/chi_crimes.csv"

download.file(url, "chi_crimes.csv")

chi = read.table("chi_crimes.csv", header = T, sep = ",")

names(chi)

sapply(chi, function(x) length(unique(x)))

chi$Date = strptime(chi$Date, "%m/%d/%Y %r")  # Change Dates from factor to a 'real' Date

chi$month = months(chi$Date)

chi$month = factor(chi$month, levels = c("January", "February", "March", "April", 
    "May", "June", "July", "August", "September", "October", "November", "December"), 
    ordered = TRUE)

# Okay how many crimes were committed in each Month of the year ?

plot(1:12, as.vector(table(chi$month)), type = "n", xaxt = "n", ylab = "Alleged Crimes", 
    xlab = "Month", main = "Chicago Crimes in 2012 by Month", ylim = c(5000, 
        33000))

grid()

axis(1, at = 1:12, labels = as.character(sapply(levels(chi$month), function(x) substr(x, 
    1, 3))), cex.axis = 0.8)

points(1:12, as.vector(table(chi$month)), type = "b", pch = 19, col = "blue")

points(1:12, as.vector(table(chi$month, chi$Arrest)[, 2]), col = "red", pch = 19, 
    type = "b")

legend(5, 20000, c("Reported Crimes", "Actual Arrests"), fill = c("blue", "red"))

barplot(table(chi$Arrest, chi$month), col = c("blue", "red"), cex.names = 0.5, 
    main = "Chicago: Reported Crimes vs. Actual Arrests")

legend("topright", c("Arrests"), fill = "red")


library(lattice)
barchart(table(chi$month, chi$ampm), stack = FALSE, auto.key = T, freq = F)

# Let's map the gambling activity - specifically the dice games

hold = chi[chi$Primary.Type == "GAMBLING", ]
hold = chi[chi$Primary.Type == "GAMBLING" & chi$Description != "GAME/DICE", 
    ]

# You will also need to do install.packages('googleVis')

library(googleVis)  # This is an addon package you must install

hold$LatLon = paste(hold$Latitude, hold$Longitude, sep = ":")

hold$Tip = paste(hold$Description, hold$Locate.Description, hold$Block, "<BR>", 
    sep = " ")

chi.plot = gvisMap(hold, "LatLon", "Tip")

plot(chi.plot)

```


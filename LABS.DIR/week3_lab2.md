BIOS560R Spring 2014 Week 3 Lab 2: Data Frames and Control Structures
============================================================
Pittard wsp@emory.edu
***

## DataFrames Part 2

Practice 1.0) Merging Data Frames

```r
tb1 = data.frame(indiv_id = 1:4, snp1 = c(1, 1, 0, 1), snp2 = c(1, 1, 0, 0))

tb2 = data.frame(indiv_id = c(1, 3, 4, 6), cov1 = c(1.14, 4.5, 0.8, 1.39), cov2 = c(74.6, 
    79.4, 48.2, 68.1))

merge(tb1, tb2, by = "indiv_id", all = TRUE)  # Brings in all data from both data frames

# Excludes indiv_id rows from tb2 that don't also appear in tb1

merge(tb1, tb2, by = "indiv_id", all.x = T)

# Excludes indiv_id rows from tb1 that don't also appear in tb2

merge(tb1, tb2, by = "indiv_id", all.y = T)

# Let's change the names in tb2

names(tb2) = c("id", "cov1", "cov2")

# Let's do a merge wherein we specify 'keys' from tb1 and tb2

merge(tb1, tb2, by.x = "indiv_id", by.y = "id", all = TRUE)
```


***

1.1) Let's use the split function on mtcars to split it up by cylinder groups


```r

# This will create a list, (hold), wherein each element is a data frame.

hold = split(mtcars, mtcars$cyl)

# The name of each element comes from the unique values taken by the 'cyl'
# variable

names(hold)

# Once we have things stashed in the list we can use sapply (or lapply) to
# loop over each element and apply some function

sapply(hold, nrow)

hold = split(mtcars, mtcars$cyl)

sapply(hold, function(x) mean(x$mpg))

```


***

1.2) We can also sort a data frame although we can't use the sort command directly as we would with a single vectors.


```r

# We use the order function to get back row numbers in the order of MPG from
# lowest to highest

order(mtcars$mpg)  # Returns row numbers representing lowest to highest MPG

mtcars[15, ]  # The Cadillac has the worst gas mileage

mtcars[20, ]  # The Corolla has the best gas mileage

head(newdata)

newdata = mtcars[order(mtcars$mpg), ]  # Sortson MPG from low to hi

head(newdata)

newdata = mtcars[rev(order(mtcars$mpg)), ]  # Sorts on MPG from hi to lo

head(newdata)

newdata = mtcars[order(-mtcars$mpg), ]  # Same as above

# We can also sort by two or more keys. Like first by cylinder then MPG

newdata = mtcars[order(mtcars$cyl, mtcars$mpg), ]  # Cyl: low to hi, MPG low to hi

newdata = mtcars[order(mtcars$cyl, -mtcars$mpg), ]  # Cyl: low to hi, MPG hi to lo

```


***

1.3) Sampling from a dataframe can be done also. We have to figure out the
number of rows and use that as input to the sample function


```r

my_records = sample(1:nrow(mtcars), 10, replace = FALSE)

my_records  # Random row numbers from mtcars

sample_of_ten = mtcars[my_records, ]  # Use my_records as input to brackets

sample_of_ten

```


***

## Control Structures

2.0) for loops are for processing elements of vectors, matrices, and lists 


```r

# for loops are simple

x = 1:3
for (ii in 1:3) {
    print(ii)
}

x = 1:3
for (ii in length(x):1) {
    # We start with the last element number
    print(ii)
}

# Here we will loop over some x values to get some y values to plot

y = vector()  # A blank vector

x = -3:3

for (ii in -3:length(x)) {
    y[ii] = x[ii]^2
}

plot(x, y, main = "Super Cool Data Plot", type = "b", pch = 19, col = "red")

# 

y = vector()

x = seq(-3, 3, by = 0.005)  # seq let's us specify and increment
for (ii in -3:length(x)) {
    y[ii] = dnorm(x[ii])
}

length(x)

plot(x, y, main = "A Great Looking Normal Distribution", type = "l")

```


***

2.1) We can use for loops to do calculations


```r

set.seed(188)

x = rnorm(1000)  # 1,000 random elements from a N(20,4)

mymin = x[1]

for (ii in 1:length(x)) {
    if (x[ii] < mymin) {
        mymin = x[ii]
    }
}

mymin

```


***

2.2) This approach can be applied to processing data frames like mtcars


```r

mpgsum = 0

for (ii in 1:nrow(mtcars)) {
    mpgsum = mpgsum + mtcars[ii, "mpg"]
}

mpgmean = mpgsum/nrow(mtcars)  # Divide the sum by the # of records

cat("Mean MPG for all cars is:", mpgmean, "\n")

```


***

2.3) We can use the for loop in conjunction with the split function to process list elements


```r

mysplit = split(mtcars, mtcars$cyl)

for (ii in 1:length(mysplit)) {
    print(nrow(mysplit[[ii]]))
}

# This is equivalent to doing the following

sapply(mysplit, nrow)

```


***

2.4) We can access the list element names and values as we loop


```r

mysplit = split(mtcars, mtcars$cyl)

for (ii in 1:length(mysplit)) {
    splitname = names(mysplit[ii])
    cat("mean for", splitname, "cylinders is", mean(mysplit[[ii]]$mpg), "\n")
}

# This is basically equivalent to

sapply(mysplit, function(x) mean(x$mpg))

```


***

2.5) As we loop over the split list we can sample records from each element


```r

for (ii in 1:length(mysplits)) {
    recs = sample(1:nrow(mysplits[[ii]]), 2, F)
    print(mysplits[[ii]][recs, ])
}

# This is equivalent to the following lapply command

lapply(mysplit, function(x) {
    recs = sample(1:nrow(x), 2, F)
    return(x[recs, ])
})
```


***

2.6) We can write our own version of the split function using a for loop approach


```r
hold = list()

kk = 1

for (ii in unique(mtcars$cyl)) {
    hold[[kk]] = mtcars[mtcars$cyl == ii, ]
    kk = kk + 1
}

names(hold) = unique(mtcars$cyl)

```


2.7) Looping over matrices is easy with for loops. However we have to use two of them. One for rows and one for columns


```r
set.seed(123)

mymat = matrix(round(rnorm(6), 2), 3, 2)

for (ii in 1:nrow(mymat)) {
    for (jj in 1:ncol(mymat)) {
        cat("The value at row", ii, "and column", jj, "is", mymat[ii, jj], "\n")
    }
}

# This will generate the sum of all the rows

rowtotal = 0  # initialize a variable to hold row total
for (ii in 1:nrow(mymat)) {
    for (jj in 1:ncol(mymat)) {
        rowtotal = rowtotal + mymat[ii, jj]
    }
    print(rowtotal)
    rowtotal = 0
}

```


***

### if statements

3.0) If statements allow us to make decisions based on the value of a vector, list, or matrix element.


```r

some.num = 3

if (some.num < 3) {
    # A more involved if statement
    print("Less than 3")
} else if (some.num > 3) {
    print("Greater than 3")
} else {
    print("Must be equal to 3")
}

# if statements are frequently used for error checking

x = 4
y = 5

if (!is.numeric(x) | !is.numeric(y)) {
    stop("I need numeric values to do this")
} else {
    if (x == y) {
        print("Equal")
    } else {
        print("Not equal")
    }
}
```


***

3.1) the ifelse statement is useful for processing vectors


```r
some.data = rnorm(10000, 0, 2)

colors = ifelse(some.data < 0, "RED", "GREEN")

plot(some.data, col = colors)

# 

mtcars$rating = ifelse(mtcars$mpg >= mean(mtcars$mpg), "blue", "red")

plot(mtcars$mpg ~ mtcars$wt, col = mtcars$rating, pch = 19, main = "MPG vs wt")

grid()

legend("topright", c("> mean", "< mean"), pch = 19, col = c("blue", "red"), 
    title = "Legend", cex = 0.7)

```


***

3.2) for and if loops are frequently found together in the same structure


```r
score = c(74, 68, 98, 90, 100, 67, 59)

for (ii in 1:length(score)) {
    if (score[ii] == 100) {
        grade = "A+"
    } else if (score[ii] >= 90) {
        grade = "A"
    } else if (score[ii] >= 80) {
        grade = "B"
    } else if (score[ii] >= 70) {
        grade = "C"
    } else if (score[ii] >= 60) {
        grade = "D"
    } else {
        grade = "F"
    }
    print(grade)
}

```


***

3.3) We can use the for loop / if statement approach to process vectors


```r
set.seed(123)

x = round(runif(10, 1, 20))

for (ii in 1:length(x)) {
    if (x[ii]%%2 == 0) {
        print(TRUE)
    } else {
        print(FALSE)
    }
}

# We can mimic the bracket notation by processing elements and storing
# computations in a vector

set.seed(123)

x = round(runif(10, 1, 20))

logvec = vector()  # Setup an empty vector

for (ii in 1:length(x)) {
    if (x[ii]%%2 == 0) {
        logvec[ii] = TRUE
    } else {
        logvec[ii] = FALSE
    }
}

logvec

x[logvec]

```


***

### while loops

3.4) The while loop exists when you don't know in advance how many times you need to iterate


```r
sum = 0
n = 1000
i = 1
while (i <= n) {
    sum = sum + i
    i = i + 1
}

sum


sum = 0
n = 1000
for (i in 1:n) {
    sum = sum + 1
}

sum

# Newton's method is useful for illustrating the power of the while loop

n = 121

iterations = 1

guess = 9

tolerance = 1e-04

diff = n - (guess^2)

while (abs(diff) >= 0.001) {
    cat("Iteration number ", iterations, "\n")
    guess = (n/guess + guess)/2
    diff = n - (guess^2)
    iterations = iterations + 1
}

```


***

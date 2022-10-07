## @knitr solution_calcs

# Exercise 1

## R as a fancy calculator

## Use R to answer the following questions for you:

#### 1.1 what is 1+1
1+1

### 1.2 What is 3 times 17 ?
3*17

### 1.3 Create an object d equal to 10.
d <- 10

### 1.4 Divide d by 5.
d/5

### 1.5 Overwrite d, let it now be equal to 20, and print d, to see the results
d <- 20
d


### 1.6 Overwrite d (which is now 20) with 4 times d, and print d top see the result
d <- d * 4
d

# 1.7 Overwrite d (which is now 80), with d times d, and print the result
d <- d * d
d

### 1.8 Create a new object A and set it equal to 3
A <- 3

### 1.9 Create another new object res, let it be the product of d and A, and output the result
res<-d * A
res

### 1.10 Finally, take the average of d, A and res
(d + A + res) / 3
# mean(c(d,A,res))




## @knitr solution_evaluations

# 1.11 Use R to answer the following questions for you:
# Is 4 greater than 2?
4 > 2

# 1.12 Is 5 less than 3?
5 < 3

# 1.13 Is 6.2 equal to 12.4/2?
6.2 == 12.4/2

# 1.14 Is 5 equal to or greater than 4?
5 >= 4

# 1.15 Is 5 equal to or less than 5? (hint:  use <=)
5 <= 5

# 1.16 Is 7.5 equal to 137.25/18?
7.5 == (137.25/18)

# 1.17 If m = 84 / 106 and q = 156/3; is m/q greater than, less than or equal to 0.0152?
m <- 84 / 106 ;  q <- 156/3
(m/q) == 0.0152
(m/q) > 0.0152
(m/q) < 0.0152


## @knitr solution_class

# Create a vector called 'odds' with the numbers 1,3,5,7,9.
odds <- c(1, 3, 5, 7, 9)
# Show what class odds is.
class(odds)
# Evaluate which numbers in the odds vector are greater than 4.
odds > 4
# Create a vector called 'fail' containing 1,3,5,'seven',9.
fail <- c(1, 3, 5, "seven", 9)
# Show what class fail is. Why is this vector this class?
class(fail)


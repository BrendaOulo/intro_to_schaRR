## @knitr Rcalcs

# add 1 to 1.
1 + 1
# divide 12 by 4
12/4
# times 3 by 7
3 * 7
# 10 to the power 3
10^3
# root isn't a basic operation so we will look at this later.

# order of operations:
5*6+2
5*(6+2)


## @knitr objectIntro

# create an object 'x' which is 3
x <-  3
# create an object 'y' which is 5
y <-  5
# add 'x' and 'y'
x + y
# overwrite 'x' so it now equals 4.
x <-  4
# add 'x' and 'y' again, now the result is 9, not 7.
x + y
# create another object 'z' which is equal to x + y at this time.
z <- x + y
z



## @knitr objectOrder

# create an object 'a' which is 10.
a <- 10
a
# add one to 'a'. 'a' is now 11.
a <- a + 1
a
# create an object called 'b' which is 5 less than 'a'
b <- a - 5
b
# change 'a' to be 5 less than it was originally
a <- a - 5
a-b
# 'a' and 'b' are equal!!!


## @knitr objectPrint

# print the objects in the environment
ls()


## @knitr objectRemove

# sometimes we may want to remove an object.
rm(a)
# multiple objects at once
rm(x,y)
# remove all objects
rm(list=ls())



## @knitr simpleEval

# simple evaluations
# is 4 greater than 2
4 > 2
# is 4 greater than 5
4 > 5
# is 4 equal to 3, note double == for an evaluation
4 == 3
# is 4 not equal to 3, note != is not equal to.
4 != 3
# is the object on the LHS equal to the object on the RHS.
"dog" == "dog"
"dog" == "cat"
# the output from an evaluation can be stored as an object. This object can be subject to operations & manipulations.
b <- 4<2
b





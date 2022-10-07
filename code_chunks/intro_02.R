## @knitr classIntro

# numeric
height <- c(1.38,1.45,1.21,1.56)
class(height)
# numeric
weight <- c(31,35,28,40)
class(weight)
# character
first_name <- c("Alice","Bob","Harry","Jane")
class(first_name)
#first_name + 1 # error
# factor
sex <- factor(x = c("F","M","M","F"))
class(sex)
# logical
tall <- height > 1.5
class(tall)
# we can even do this for functions.
class(class)



## @knitr classOperations

# Add
c(1, 2, 3) + 1
c(1, 2, 3) + c(1, 2, 3)
# recycling of values in shorter vector
c(1, 2, 3, 4) + c(1, 0, 1)
# warning (! no error!)

# Multiply
heightft <- height * 3.28

# combine
c(height, weight)

# combine different classes
v_data <- c(height, weight, first_name)

class(height)
class(v_data)




## @knitr vectors

# the combine function
c(1, 2, 3)
# the colon operator to generate a sequence
1:3
# the vector function directly
vector(mode = "numeric", length = 10)
# direct operations, such as discounting:
1 / (1+0.035)^(0:100)
# or seasonality adjustment for covid-19
1 - 0.2/2 * sin(x = 2 * pi * (1:365 - 92)/365)



## @knitr matrices

# create a 3 x 3 matrix containing the numbers 1:9
m_nums <- matrix(data = 1:9, # 1:9 creates a vector of integers from 1 to 9.
                 nrow = 3,
                 ncol = 3, #  number of columns
                 byrow = T) # fill the numbers in by row

class(m_nums)

# perform operations as with vectors
m_nums * 3
m_nums > 5

# transpose the matrix...
t(m_nums)

# perform matrix multiplication
# we will cover this later
m_nums %*% m_nums

# we have the same issue as with vectors
# a matrix must be of one class.
# note the cbind function binds together two objects by column.
cbind(m_nums,
      c("A", "B", "C"))

class(m_nums)





## @knitr arrays

# create a 3 x 3 x 10 matrix containing the numbers 1:90
# I think of the dimensions of the array as
# 1) rows, 2) columns, 3) depth
# 1:90 creates a vector of integers from 1 to 9.
a_nums <- array(data = 1:90,
                dim = c(3,3,10)) # see above

a_nums

# perform operations as with vectors
a_nums * 3
a_nums > 5

class(a_nums)





## @knitr dataframes

# data frame- columns are variables, rows are observations.
df <- data.frame(height,
                 weight,
                 first_name,
                 sex)
class(df)
# we can select a single variable within the dataframe using the dollar sign.
df$height
# We can add a new variable easily,
# in this case based on other variables within the dataframe.
df$bmi <- df$weight / df$height^2

df



## @knitr lists

# no structure is required.
l_letters <- list("A" = 1:10,
                  "B" = 1:2,
                  "C" = T,
                  "D" = c("oh no", "so unstructured", "too much flexibility", "help"))
# the class is 'list'
class(l_letters)
# we can add things to a list very easily...
l_letters$E <- "added something"

l_letters






## @knitr subsettingVectors

# we can subset vectors using square brackets
v_integers <- 1:10
v_integers[5]
# indexing with a minus returns everything except
v_integers[-5]
# indexing with another vector is possible
v_integers[c(1,3,5)]





## @knitr subsettingMatrices

# we can subset matrices using square brackets.
m_integers <- matrix(data = 1:9, nrow = 3, ncol = 3, byrow = T)
# the first number references rows, the second columns
# this is row 1, column 3
m_integers[1, 3]
# this is the whole of row 2
m_integers[2,]
# this is rows 1:2 and columns 2:3
m_integers[1:2,2:3]

## Arrays

# create the array as above
a_nums <- array(data = 1:90,
                dim = c(3,3,10)) # see above

# we now need to subset the three dimensional object.
a_nums[1,1,1]
# if we leave one dimension undefined it will give us a vector
a_nums[1,1,]
# if we leave two dimensions undefined it will give a matrix (slice of the 'cube')
a_nums[,,1]
# as always we can use vectors
# R will display the third dimension as printed iterations
a_nums[,,1:10]





## @knitr subsettingDF

# Our previous data-frame contains the height, weight, first name and bmi of 4 individuals.
df
# To subset a data frame we can use square brackets i.e df[row,column]
# Or to subset a column we can use $. This works because the columns are organised in a list.
df$height
df[,"height"]
df[,1]
df[,1:3]
df[,c(1,3)]
#selecting a row(s)
df[1,]
#We might also want to select observations (rows) based on the characteristics of the data
#E.g. we might want to only look at the data for people who are taller than 1.75m
#create a logical variable called min_height which contains T/F for each individual being over 175cm.
min_height <- df$height >= 1.75
min_height
# Subset the data to include only those observations (rows) for which height > 175cm (using min_height).
df.at_least_175 <- df[min_height,]
df.at_least_175
#People smaller than 1.75m
# Subset the data to include only those who are not above min-height of 175cm.
smaller <- df$height < 1.75
df[smaller,]
df[!min_height,]

## @knitr subsettingLists
# as with dataframes we can subset with index numbers in double brackets or $
l_letters[[1]]
# or with the
l_letters$B
# we can index where there are nested objects
l_letters$D[1]

## @knitr exercise_framingham_A

# Exercise 3A

# One group uses subset male and one female

# 1. Use ls() to check your global environment
# Info: When starting a new project, you should check your global environment
# (= the objects existing in your R session)
# and make sure you don't have old, useless objects hanging around.
# ls()

#

# 2. Clear the environment using the rm() function and check if it has worked.
# NOTE:
# You can use rm either with variable names (c("varname_1", "varname_2",...)), or, to remove all objects,
# you can use ls() itself as an argument for the function.
# rm(list = ls())
# ls()

# 3. Load the raw data set into your environment and get an overview using the str() function
# NOTE:
# df_framingham <- read.csv("URL")
# df_framingham <- read.csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/df_framingham.csv")

# 4. Inspect the first few rows of the df_framingham data frame
# NOTE:
# tail(df_framingham) shows you the last few rows of the data frame.

# 5. How many NA does df_framingham$sysBP have?
# NOTE:
# is.na(vector) returns T/1 if vector is NA, and F/0 otherwise.


# 6. Remove all rows with NA from df_framingham




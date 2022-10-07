## @knitr solution_framingham_A

# Exercise 3A

# 1. Use ls() to check your global environment
ls() # there will be a fake old object

# 2. Clear the environment using the rm() function and check if it has worked.
rm(list = ls())

# 3. Load the raw data set into your environment and get an overview using the str() function
df_framingham <- read.csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/df_framingham.csv")
str(df_framingham)

# 4. Inspect the first few rows of the df_framingham data frame
head(df_framingham)

# 5. How many NA does df_framingham$sysBP have?
sum(is.na(df_framingham$sysBP))

# 6. Remove all rows with NA IN sysBP from df_framingham
df_framingham <- df_framingham[!is.na(df_framingham$sysBP), ]

# check this result against the stored result on GitHub:
assertthat::are_equal(df_framingham,
                      read.csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/df_framingham_A.csv",
                                row.names = 1)
)


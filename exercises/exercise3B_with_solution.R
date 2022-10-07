## @knitr solution_framingham_B

# Exercise 3B

# If there was a problem with exercise 3A feel free to read in the solution from GitHub
df_framingham <- read.csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/df_framingham_A.csv",
                          row.names = 1)

# 7. Create a subset of df_framingham, either containing only cases females, in that case name your new dataframe df_framingham_female,
# or only males, then call your new dataframe df_framingham_male.
df_framingham_male <- df_framingham[df_framingham$sex == "male",]

# 8. what is the median sys bp in the subsetted dataframe?
median(df_framingham_male$sysBP)

# 9. What is the range (difference between highest and the lowest) of blood pressure values in your sample?
max(df_framingham_male$sysBP) - min(df_framingham_male$sysBP)
diff(range(df_framingham_male$sysBP))

# 10. Create a histogram to view the distribution of sysBP in your sub-sample.
hist(df_framingham_male$sysBP)

# 11. Create a scatter plot for the relationship between age and systolic blood pressure in your subsample.
plot(df_framingham_male$age, df_framingham_male$sysBP)

# check this result against the stored result on GitHub - note that the github example is for males...
assertthat::are_equal(df_framingham_male,
                      read.csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/df_framingham_B.csv",
                               row.names = 1)
)


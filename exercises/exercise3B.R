## @knitr exercise_framingham_B

# Exercise 3B

# If there was a problem with exercise 3A feel free to read in the solution from GitHub
# df_framingham <- read.csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/df_framingham_A.csv",
#                           row.names = 1)

# 7. Create a subset of df_framingham, either containing only females cases, in the case name our new dataframe df_framingham_female
#    or only males, then call your new dataframe df_framingham_male.

# 8. what is the median blood pressure (sysBP) in the subsetted dataframe?
# NOTE:
# Analogous to mean(), there is a function in R called median()!


# 9. What is the range (difference between highest and the lowest) of blood pressure values in your sample?
# NOTE:
# You may want to use the functions max() and min(), or the function range() for this.


# 10. Plot a histogram of BP in males/females
# NOTE:
# If you want, you can try to use the hist(...) function with an additional style argument: xlab = "Systolic blood pressure".


# 11. Create a scatter plot for the relationship between age and systolic blood pressure in your subsample
# NOTE:
# Use age for the x-axis, and sysBP for the y-axis in the plot() function. And then use the fit_f/fit_m object in the abline() function.

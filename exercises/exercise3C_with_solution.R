## @knitr solution_framingham_C

# Exercise 3C

# If there was a problem with exercise 3B feel free to read in the solution from GitHub
df_framingham_male <- read.csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/df_framingham_B.csv",
                          row.names = 1)

# 12. Fit a linear regression to model the association between sysBP and age.
# Call the model either fit_m (for males) or fit_f (for females). Then use summary() to inspect the details.
fit_m <- lm( sysBP ~ age, data = df_framingham_male)
summary(fit_m)

# 13. What is the predicted blood pressure of a 40 year old individual in your subsample?
sys_bp_40 <- fit_m$coefficients["(Intercept)"] + 40 * fit_m$coefficients["age"]
# or we can use the predict function in R and pass a new data-frame containing
# a column for each independent variable
sys_bp_40 <- predict(object = fit_m, newdata = data.frame(age = 40))

# we can plot this result...
plot(x = df_framingham_male$age,
     y = df_framingham_male$sysBP,
     type = "p",
     xlab = "Age",
     ylab = "Sys BP")
abline(reg = fit_m, col = "black")
abline(v = 40, col = "red")
abline(h = sys_bp_40, col = "red")


## @knitr dataImport

# This line creates the file, run this first.
# write.csv(mtcars, file = "car_Data.csv")
# This line reads it ... note the path is relative
# car_Data <- read.csv(file = "car_Data.csv", header = TRUE)
# If you can't find it, you can choose a file using:
# read.csv(file.choose())
# if you couldn't get that to work don't worry, this is an example dataset from base R.
car_Data <- mtcars





## @knitr dataExternal

# we can read external data by using a URL in place of the file path...
car_Data <- read.csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/car_Data.csv")

# or we can load the readr package, if this is not installed then install it.
#install.packages("readr")
library(readr)
#use the function read_csv
car_Data <- as.data.frame(read_csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/car_Data.csv"))

# we could also have used the function from the package directly like this:
#readr::read_csv("https://raw.githubusercontent.com/dark-peak-analytics/teaching_data/main/car_Data.csv")





## @knitr headCars

# head data with default 6 rows
head(car_Data)

# head data with 10 rows
head(car_Data, n = 10)





## @knitr summaryCars

# basic summary stats
mean(car_Data$mpg)
sd(car_Data$mpg)
min(car_Data$mpg)
max(car_Data$mpg)
median(car_Data$mpg)
quantile(car_Data$mpg, probs = c(0.75, 0.25))
summary(car_Data$mpg)

# summarise the whole data,
summary(car_Data)

# we can save the outputs of summary
temp <- summary(car_Data$mpg)
Median  <- temp['Median']
Range   <- temp['Max.'] - temp['Min.']





## @knitr linePlot

#plot of mpg vs disp
plot(x = car_Data$disp, y = car_Data$mpg)
#notice we can remove arguments and still get same result
plot(car_Data$disp, car_Data$mpg)
# if we wanted a line, we could add it, although think about the best plot...
plot(x = car_Data$disp, y = car_Data$mpg, type = "l")






## @knitr detailedPlot

plot(x = car_Data$disp,
     y = car_Data$mpg,
     type = "p",
     xlab = "Displacement",
     ylab = "Miles per Gallon",
     main = "MPG vs Engine Displacement")






## @knitr histograms

hist(x = car_Data$mpg)
#We can alter the 'bins' by specifying the additional argument 'breaks = ' in the hist function
hist(x = car_Data$mpg,
     breaks = c(10, 12.5, 15, 17.5, 20, 22.5, 25, 27.5, 30, 32.5, 35))
#a neater way of doing the same as above is to use seq
hist(car_Data$mpg, breaks = seq(10, 35, by = 2.5))
# or a number of breaks
hist(x = car_Data$mpg, breaks = 11)
#we can again edit the title etc by adding extra arguments
hist(car_Data$mpg,
     breaks = seq(10,35, by = 2.5),
     xlab = "Miles per gallon",
     main = "Histogram of Miles per Gallon")
# we can also use a density plot...
plot(density(x = car_Data$mpg))


## @knitr linearRegression

# plot a scatter to see this visually...
plot(x = car_Data$wt,
     y = car_Data$mpg,
     xlim = c(1,6),
     ylim = c(0,40),
     xlab = "Weight (lb)",
     ylab = "Miles per Gallon (mpg)",
     main = "Heavier cars achieve lower miles per gallon")
# linear regression model with one independent variable
# we would expect heavier cars to be less fuel efficient
mod1 <- lm(formula = mpg ~ wt, data = car_Data)
class(mod1)
# lets look at the regression table
summary(mod1)
# now lets add a linear regression line here.
abline(reg = mod1)
# we can use our model to predict mpg at a level of weight manually
# weight of 2
mod1$coefficients['(Intercept)'] + mod1$coefficients['wt'] * 2
# or we can do this using predict
predict(object = mod1,
        newdata = data.frame(wt = 2))

## @knitr dplyr_filter_1

1 %in% 1:10
12 %in% 1:10
c(1, 2) %in% 1:10

## @knitr dplyr_filter_2

NA == NA
NA != NA
1 == NA

NULL == NULL
NULL != NULL
1 == NULL

is.na(NA)
is.null(NULL)


## @knitr dplyr_filter_3

# this should be true
sqrt(2) ^ 2 == 2

# this is true:
round(sqrt(2) ^ 2, 10) == 2

# this is true, a tolerance is set by default but we can overwrite
dplyr::near(x = sqrt(2) ^ 2, y = 2, tol = 0.0000001)


## @knitr dplyr_filter_4

rm(list = ls())

# going to create a new object called df_cars
df_cars <- mtcars

# filter rows where mpg greater than 20 & wt greater than 3
dplyr::filter(df_cars, mpg > 20,  wt > 3)
dplyr::filter(df_cars, mpg > 20 & wt > 3)

# filter rows where mpg greater than 20 or wt greater than 3
dplyr::filter(df_cars, mpg > 20 | wt > 3)








## @knitr dplyr_select_1

rm(list = ls())

# create object called df_cars
df_cars <- mtcars

# select the mpg column and the weight column
dplyr::select(df_cars, mpg, wt)

# there are helper functions to assist where there may be a large number of columns
# select those starting with c
dplyr::select(df_cars, dplyr::starts_with("c"))
# or remove those from vs to carb...
dplyr::select(df_cars, -(vs:carb))






## @knitr dplyr_mutate_1

rm(list = ls())

# create object called df_cars
df_cars <- mtcars

# we can create a new variable - note that values not recycled
dplyr::mutate(df_cars, string = "string")

# we can overwrite variables (here we convert from lbs to kg)
dplyr::mutate(df_cars, wt = wt * 0.453592)

# create a new variable which is the rank of weight... heaviest first
df_cars_wtranked <- dplyr::mutate(df_cars, wt_rank = base::rank(-wt))

# note that we can create multiple values at once in mutate
dplyr::mutate(df_cars,
              wt_desc = dplyr::case_when(wt > 3 ~ "heavy",
                                wt <= 3 ~ "light"),
              mpg_desc = dplyr::case_when(mpg > 20 ~ "efficient",
                                   mpg <= 20 ~ "inefficient")
              )


## @knitr dplyr_summarise_1

rm(list = ls())

# create object called df_cars
df_cars <- mtcars

# we can find the mean weight using the summarise function...
dplyr::summarise(df_cars, mean_wt = mean(wt, na.rm = TRUE))

# or we can find the grouped means by the 'cyl' variable
# here we use the 'group_by' function to group the data
df_cars_grouped <- dplyr::group_by(.data = df_cars, cyl)
# and then calculate the summary stat on the grouped data
dplyr::summarise(df_cars_grouped,
                 mean_wt = mean(wt, na.rm = TRUE))

# or we can nest the functions ... either is fine as long as clearly explained
dplyr::summarise(dplyr::group_by(.data = df_cars, cyl),
                 mean_wt = mean(wt, na.rm = TRUE))




## @knitr dplyr_arrange_1

rm(list = ls())

# create object called df_cars
df_cars <- mtcars

# can arrange by a variable, e.g. mpg
dplyr::arrange(df_cars, mpg)

# can arrange by a variable, e.g. mpg and then within that by another, e.g. wt
dplyr::arrange(df_cars, mpg, wt)

# can arrange largest to biggest using the '-' sign or desc
dplyr::arrange(df_cars, -mpg)
dplyr::arrange(df_cars, dplyr::desc(mpg))



## @knitr dplyr_pipes_1

rm(list = ls())

# user specified inputs - urls and dates:
case_url <- "https://api.coronavirus.data.gov.uk/v2/data?areaType=nation&metric=newCasesBySpecimenDate&format=csv"

# use dplyr to select necessary variables,
# change the date to date format...
# limit the dataset to 2022
# group by the areaName variable (country)
# find the total number of cases since Jan 22.
# arrange them in order of number of cases.
read.csv(case_url) %>%
  dplyr::select(areaName, date, newCasesBySpecimenDate) %>%
  dplyr::mutate(date = base::as.Date(date)) %>%
  dplyr::filter(date >= "2022-01-01") %>%
  dplyr::group_by(areaName) %>%
  dplyr::summarise(total22 = base::sum(newCasesBySpecimenDate, na.rm = T)) %>%
  dplyr::arrange(dplyr::desc(total22))





## @knitr dplyr_pipes_2

rm(list = ls())

england_hosp_url <- "https://api.coronavirus.data.gov.uk/v2/data?areaType=nation&areaCode=E92000001&metric=covidOccupiedMVBeds&metric=hospitalCases&metric=newAdmissions&format=csv"

# use dplyr to select necessary variables,
# mutate date from character to date format.
# limit the dataset to 2021
# group by week of year
# use summarise to get weekly admissions
# select the column we want - week_total
# unlist the column (converts to a vector)
# plot the result using base R - we will show how to do this with ggplot later
read.csv(england_hosp_url) %>%
  dplyr::select(areaName, date, newAdmissions) %>%
  dplyr::mutate(date = base::as.Date(date)) %>%
  dplyr::filter(date >= "2021-01-01" & date < "2022-01-01") %>%
  dplyr::group_by(week = lubridate::week(date)) %>%
  dplyr::summarise(week_total = base::sum(newAdmissions, na.rm = T)) %>%
  dplyr::select(week_total) %>%
  base::unlist() %>%
  base::plot(type = "l",
             xlab = "Week of Year",
             ylab = "Weekly admissions",
             main = "Total admissions with positive test result, by week number, 2021")






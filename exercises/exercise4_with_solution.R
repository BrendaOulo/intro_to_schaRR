## @knitr solution_dplyr

# Exercise 4
 rm(list = ls())

 library(dplyr)

# 0. create an object with a string for vaccine data url (data.gov.uk)
url <- "https://api.coronavirus.data.gov.uk/v2/data?areaType=utla&metric=cumVaccinationFirstDoseUptakeByVaccinationDatePercentage&metric=cumVaccinationSecondDoseUptakeByVaccinationDatePercentage&metric=cumVaccinationThirdInjectionUptakeByVaccinationDatePercentage&format=csv"


# 0. read in the data from the gov.uk api
# we immediately rename some variables to make things easier to see
df_vac <-
  read.csv(url) %>%
  rename(first = cumVaccinationFirstDoseUptakeByVaccinationDatePercentage,
         second = cumVaccinationSecondDoseUptakeByVaccinationDatePercentage,
         third = cumVaccinationThirdInjectionUptakeByVaccinationDatePercentage)

# 1. Summarise the data, what variables do we have? What class are they?
#    Does it matter that date is class 'character'?

names(df_vac)
summary(df_vac)


# 2. On 1st January 2022 which UTLA had the highest 'third dose vaccine' uptake
df_vac %>%
  filter(date == "2022-01-01") %>%
  arrange(-third) %>%
  head

# 3. Which English UTLA had the highest 'first dose uptake' on 1st July 2022
#  NOTE: the function 'grepl' returns true for values which contain a pattern of strings
#        for example: grepl(pattern = "E", x = df_vac$areaCode) returns true where the
#        area code contains an E (e.g. for England).
df_vac %>%
  filter(date == "2022-07-01" & grepl(pattern = "E", x = areaCode) ) %>%
  arrange(-first) %>%
  head

# 4. On which date did the following areas achieve 80% second dose vaccine
#    uptake: c("Dorset", "Rutland", "York", "Gateshead")
#    it is possible to organise this all into one dataframe.
df_vac %>%
  group_by(areaName) %>%
  mutate(date = as.Date(date),
         second_above_80 = second >= 80) %>%
  filter(second_above_80 == T) %>%
  filter(date == min(date)) %>%
  filter(areaName %in% c("Dorset", "Rutland", "York", "Gateshead")) %>%
  arrange(date) %>%
  head


# 5. Limit the data to start on the first January 2021 and finish on 1st July 2022
#    select the areaName, date, first, second and third dose variables.
#    group by the date,
#    calculate the un-weighted mean uptake for each dose across all UTLAs
df_vac_clean <- df_vac %>%
  dplyr::mutate(date = as.Date(date)) %>%
  dplyr::filter(date >= "2021-01-01" & date <= "2022-07-01") %>%
  dplyr::select(areaName, date, first, second, third)

df_vac_means <- df_vac_clean %>%
  dplyr::group_by(date) %>%
  dplyr::summarise(
    first_mean = mean(first, na.rm = T),
    second_mean = mean(second, na.rm = T),
    third_mean = mean(third, na.rm = T)
  )

# 6. On the 1st January 2022 what was the un-weighted mean vaccination percentage
#    for each dose across UTLAs
df_vac_means %>%
  filter(date == "2022-01-01")


# adapt the following to create a simple plot of the unweighted mean UTLA uptake
# over time. We will go into more detail on ggplot in later stages...
ggplot2::ggplot(df_vac_means,
                 ggplot2::aes(x = date))+
  ggplot2::theme_classic()+
  ggplot2::scale_y_continuous(name = "Uptake (%)")+
  ggplot2::scale_x_date(name = "", date_breaks = "2 months")+
  ggplot2::geom_line(ggplot2::aes(y = first_mean), col = "blue")+
  ggplot2::geom_line(ggplot2::aes(y = second_mean), col = "green")+
  ggplot2::geom_line(ggplot2::aes(y = third_mean), col = "red")


# or if feeling bold then try adapting this code
# note: you will need to install the tidyr package
library(tidyr)

df_vac_longer <- tidyr::pivot_longer(df_vac_means,
                                     names_to = "dose",
                                     cols = c("first_mean", "second_mean", "third_mean"))
# produce a plot with colours defined...
ggplot2::ggplot(df_vac_longer,
                ggplot2::aes(x = date, y = value, col = dose))+
  ggplot2::theme_classic()+
  ggplot2::theme(legend.position = "bottom")+
  ggplot2::geom_line()+
  ggplot2::scale_y_continuous(name = "Uptake (%)")+
  ggplot2::scale_x_date(name = "", date_breaks = "2 months")+
  ggplot2::scale_colour_manual("Dose",
                               values = c("first_mean" = "red", "second_mean" = "green", "third_mean" = "blue"),
                               labels = c("first_mean" = "1", "second_mean" = "2", "third_mean" = "3"))


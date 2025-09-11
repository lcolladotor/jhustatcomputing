## ---------------------------------------------------------------------------------------------------
#| eval: false
# install.packages("tidyverse")
# install.packages("tidytuesdayR")


## ---------------------------------------------------------------------------------------------------
Exp <- function(x, k) {
    # Add your solution here
}


## ---------------------------------------------------------------------------------------------------
sample_mean <- function(x) {
    # Add your solution here
}

sample_sd <- function(x) {
    # Add your solution here
}


## ---------------------------------------------------------------------------------------------------
alpha <- 1 - 0.95
degrees_freedom <- 50 - 1
t_score <- qt(p = alpha / 2, df = degrees_freedom, lower.tail = FALSE)


## ---------------------------------------------------------------------------------------------------
calculate_CI <- function(x, conf = 0.95) {
    # Add your solution here
}


## ----eval=FALSE-------------------------------------------------------------------------------------
# calculate_CI(x, conf = 0.95)


## ----eval=FALSE-------------------------------------------------------------------------------------
# dat <- data.frame(x = x)
# fit <- lm(x ~ 1, dat)
# 
# # Calculate a 95% confidence interval
# confint(fit, level = 0.95)


## ----eval=FALSE-------------------------------------------------------------------------------------
# tuesdata <- tidytuesdayR::tt_load("2020-01-07")
# rainfall <- tuesdata$rainfall
# temperature <- tuesdata$temperature


## ----message=FALSE----------------------------------------------------------------------------------
library(here)
if (!file.exists(here("data", "tuesdata_rainfall.RDS"))) {
    tuesdata <- tidytuesdayR::tt_load("2020-01-07")
    rainfall <- tuesdata$rainfall
    temperature <- tuesdata$temperature

    # save the files to RDS objects
    saveRDS(tuesdata$rainfall, file = here("data", "tuesdata_rainfall.RDS"))
    saveRDS(tuesdata$temperature, file = here("data", "tuesdata_temperature.RDS"))
}


## ----eval=TRUE, message=FALSE-----------------------------------------------------------------------
rainfall <- readRDS(here("data", "tuesdata_rainfall.RDS"))
temperature <- readRDS(here("data", "tuesdata_temperature.RDS"))


## ----message=FALSE----------------------------------------------------------------------------------
library(tidyverse)

glimpse(rainfall)
glimpse(temperature)


## ---------------------------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------------------------
# Add your solution here


## ----eval=FALSE-------------------------------------------------------------------------------------
# df %>%
#     filter(city_name == "PERTH", year == 2000) %>%
#     ggplot(aes(log(rainfall))) +
#     geom_histogram()


## ---------------------------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


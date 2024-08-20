## ------------------------------------------------------------------------------------------------------------------------
library(tidyr)
relig_income


## ----message=FALSE-------------------------------------------------------------------------------------------------------
library(tidyverse)

relig_income %>%
    pivot_longer(-religion, names_to = "income", values_to = "respondents") %>%
    mutate(religion = factor(religion), income = factor(income))


## ----eval = FALSE--------------------------------------------------------------------------------------------------------
## library(dplyr)
## library(tidyr)
## library(readr)
## library(ggplot2)


## ----eval = FALSE--------------------------------------------------------------------------------------------------------
## library(tidyverse)


## ------------------------------------------------------------------------------------------------------------------------
# Gather everything EXCEPT religion to tidy data
relig_income %>%
    pivot_longer(-religion, names_to = "income", values_to = "respondents")


## ------------------------------------------------------------------------------------------------------------------------
relig_income %>%
    pivot_longer(-religion, names_to = "income", values_to = "respondents") %>%
    mutate(religion = factor(religion), income = factor(income)) %>%
    group_by(income) %>%
    summarize(total_respondents = sum(respondents)) %>%
    pivot_wider(
        names_from = "income",
        values_from = "total_respondents"
    ) %>%
    knitr::kable()


## ------------------------------------------------------------------------------------------------------------------------
library(gapminder)
gapminder


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself


## ----set.seed(123)-------------------------------------------------------------------------------------------------------
df <- tibble(
    "company" = rep(1:3, each = 4),
    "year" = rep(2006:2009, 3),
    "Q1" = sample(x = 0:100, size = 12),
    "Q2" = sample(x = 0:100, size = 12),
    "Q3" = sample(x = 0:100, size = 12),
    "Q4" = sample(x = 0:100, size = 12),
)
df


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself


## ------------------------------------------------------------------------------------------------------------------------
gapminder %>%
    unite(
        col = "country_continent_year",
        country:year,
        sep = "_"
    )


## ------------------------------------------------------------------------------------------------------------------------
gapminder %>%
    unite(
        col = "country_continent_year",
        country:year,
        sep = "_"
    ) %>%
    separate(
        col = "country_continent_year",
        into = c("country", "continent", "year"),
        sep = "_"
    )


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>%
##     separate(x, c("one", "two", "three"))
## 
## tibble(x = c("a,b,c", "d,e", "f,g,i")) %>%
##     separate(x, c("one", "two", "three"))


## ------------------------------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


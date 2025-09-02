## ----eval=FALSE-------------------------------------------------------------------
# ## Install the tidyverse package if you don't have it
# if (!require("tidyverse", quietly = TRUE)) {
#     install.packages("tidyverse")
# }


## ----message=FALSE----------------------------------------------------------------
library("tidyverse")


## ----eval=FALSE-------------------------------------------------------------------
# ## Install the tidytuesdayR package if you don't have it
# if (!require("tidytuesdayR", quietly = TRUE)) {
#     install.packages("tidytuesdayR")
# }
# 
# ## For the GitHub version of tidytuesdayR (in case the CRAN version is not available)
# ## you'll need the "remotes" package to install it.
# ## See for example https://github.com/dslc-io/tidytuesdayR/issues/94 which led
# ## to tidytuesdayR not been available from CRAN at the end of August 2024
# 
# ## Install the remotes package if you don't have it
# if (!require("remotes", quietly = TRUE)) {
#     install.packages("remotes")
# }
# ## Install the tidytuesdayR package (from GitHub) if you don't have it
# if (!require("tidytuesdayR", quietly = TRUE)) {
#     remotes::install_github("dslc-io/tidytuesdayR")
# }
# 


## ---------------------------------------------------------------------------------
#| eval: false
# tuesdata <- tidytuesdayR::tt_load("2022-01-18")
# chocolate <- tuesdata$chocolate


## ---------------------------------------------------------------------------------
#| message: false
library("here")
library("tidyverse")

# tests if a directory named "data" exists locally
if (!dir.exists(here("data"))) {
    dir.create(here("data"))
}

# saves data only once (not each time you knit a R Markdown)
if (!file.exists(here("data", "chocolate.RDS"))) {
    url_csv <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2022/2022-01-18/chocolate.csv"
    chocolate <- readr::read_csv(url_csv)

    # save the file to RDS objects
    saveRDS(chocolate, file = here("data", "chocolate.RDS"))
}


## ---------------------------------------------------------------------------------
#| eval: true
#| message: false
chocolate <- readRDS(here("data", "chocolate.RDS"))
as_tibble(chocolate)


## ---------------------------------------------------------------------------------
glimpse(chocolate)


## ---------------------------------------------------------------------------------
# Add your solution here and describe your answer afterwards


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
#| message: false

## Generate some random numbers
dat <- tibble(x = rnorm(100))
slice(dat, 1:3)

## Create a new column that indicates whether the value of 'x' is positive or negative
dat %>%
    mutate(is_positive = case_when(
        x >= 0 ~ "Yes",
        x < 0 ~ "No"
    ))


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
chocolate %>%
    ggplot(aes(
        x = as.factor(review_date),
        y = rating,
        fill = review_date
    )) +
    geom_violin()


## ---------------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


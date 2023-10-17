## ----eval=FALSE-------------------------------------------------------------
## b_lyrics <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/beyonce_lyrics.csv")
## ts_lyrics <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/taylor_swift_lyrics.csv")
## sales <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/sales.csv")


## ----message=FALSE----------------------------------------------------------
library("here")
rds_files <- c("b_lyrics.RDS", "ts_lyrics.RDS", "sales.RDS")
## Check whether we have all 3 files
if (any(!file.exists(here("data", rds_files)))) {
    ## If we don't, then download the data
    b_lyrics <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/beyonce_lyrics.csv")
    ts_lyrics <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/taylor_swift_lyrics.csv")
    sales <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/sales.csv")

    ## Then save the data objects to RDS files
    saveRDS(b_lyrics, file = here("data", "b_lyrics.RDS"))
    saveRDS(ts_lyrics, file = here("data", "ts_lyrics.RDS"))
    saveRDS(sales, file = here("data", "sales.RDS"))
}


## ----eval=TRUE, message=FALSE-----------------------------------------------
b_lyrics <- readRDS(here("data", "b_lyrics.RDS"))
ts_lyrics <- readRDS(here("data", "ts_lyrics.RDS"))
sales <- readRDS(here("data", "sales.RDS"))


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
# Add your solution here


## ---------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


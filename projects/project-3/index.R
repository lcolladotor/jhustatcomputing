
## b_lyrics <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/beyonce_lyrics.csv")
## ts_lyrics <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/taylor_swift_lyrics.csv")
## sales <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/sales.csv")



library(here)
if (!file.exists(here("data", "b_lyrics.RDS"))) {
    b_lyrics <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/beyonce_lyrics.csv")
    ts_lyrics <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/taylor_swift_lyrics.csv")
    sales <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-29/sales.csv")

    # save the files to RDS objects
    saveRDS(b_lyrics, file = here("data", "b_lyrics.RDS"))
    saveRDS(ts_lyrics, file = here("data", "ts_lyrics.RDS"))
    saveRDS(sales, file = here("data", "sales.RDS"))
}



b_lyrics <- readRDS(here("data", "b_lyrics.RDS"))
ts_lyrics <- readRDS(here("data", "ts_lyrics.RDS"))
sales <- readRDS(here("data", "sales.RDS"))



# Add your solution here



# Add your solution here



# Add your solution here



# Add your solution here



# Add your solution here



# Add your solution here



# Add your solution here



# Add your solution here



# Add your solution here



# Add your solution here



options(width = 120)
sessioninfo::session_info()


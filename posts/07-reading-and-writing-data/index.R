## ---------------------------------------------------------------------------------------------------
#| echo: false
#| message: false
library(here)


## ----eval=FALSE-------------------------------------------------------------------------------------
# getwd()


## ----eval=FALSE-------------------------------------------------------------------------------------
# setwd()


## ----eval=FALSE-------------------------------------------------------------------------------------
# setwd("C:\\Users\\Brian\\path\\only\\that\\Brian\\has")


## ----eval=FALSE-------------------------------------------------------------------------------------
# setwd("/Users/bcaffo/data")
# setwd("~/Desktop/files/data")
# setwd("C:\\Users\\Michelle\\Downloads")


## ----eval=FALSE-------------------------------------------------------------------------------------
# setwd("../data")
# setwd("../files")
# setwd("..\tmp")


## ---------------------------------------------------------------------------------------------------
getwd()
list.files()


## ---------------------------------------------------------------------------------------------------
library(here)

list.files(here::here())
list.files(here("data"))


## ----eval=FALSE-------------------------------------------------------------------------------------
# if (!file.exists(here("my", "relative", "path"))) {
#     dir.create(here("my", "relative", "path"))
# }
# list.files(here("my", "relative", "path"))


## ---------------------------------------------------------------------------------------------------
df <- read.csv(here("data", "team_standings.csv"))
df


## ---------------------------------------------------------------------------------------------------
df$Team


## ---------------------------------------------------------------------------------------------------
here("data", "team_standings.csv")


## ----eval=FALSE-------------------------------------------------------------------------------------
# source(here::here("functions.R"), echo = TRUE)


## ----save-r-data-formats, echo = FALSE, fig.cap = "Save data into R data file formats: RDS and RDATA"----
knitr::include_graphics("http://www.sthda.com/sthda/RDoc/images/save-data-into-r-data-formats.png")


## ---------------------------------------------------------------------------------------------------
x <- 1:5
save(x, file = here("data", "x.Rda"))
saveRDS(x, file = here("data", "x.Rds"))
list.files(path = here("data"))


## ---------------------------------------------------------------------------------------------------
new_x1 <- readRDS(here("data", "x.Rds"))
new_x1


## ---------------------------------------------------------------------------------------------------
new_x2 <- load(here("data", "x.Rda"))
new_x2


## ----message=FALSE----------------------------------------------------------------------------------
file.remove(here("data", "x.Rda"))
file.remove(here("data", "x.Rds"))
rm(x)


## ----eval=FALSE-------------------------------------------------------------------------------------
# x <- 1:5
# y <- x^2
# save(x, y, file = here("data", "x.Rda"))
# new_x2 <- load(here("data", "x.Rda"))


## ----eval=FALSE-------------------------------------------------------------------------------------
# file.remove(here("data", "x.Rda"))


## ----eval=FALSE-------------------------------------------------------------------------------------
# data <- read.table("foo.txt")


## ----eval=FALSE-------------------------------------------------------------------------------------
# initial <- read.table("datatable.txt", nrows = 100)
# classes <- sapply(initial, class)
# tabAll <- read.table("datatable.txt", colClasses = classes)


## ----echo = FALSE-----------------------------------------------------------------------------------
readr_functions <- data.frame(
    func = c(
        "`read_csv()`",
        "`read_csv2()`",
        "`read_tsv()`",
        "`read_delim()`",
        "`read_fwf()`",
        "`read_log()`"
    ),
    file_type = c(
        "Reads comma-separated file",
        "Reads semicolon-separated file",
        "Reads tab-separated file",
        "General function for reading delimited files",
        "Reads fixed width files",
        "Reads log files"
    )
)
knitr::kable(readr_functions, col.names = c("`readr` function", "Use"))


## ----echo=TRUE--------------------------------------------------------------------------------------
library(readr)
teams <- read_csv(here("data", "team_standings.csv"))
teams


## ---------------------------------------------------------------------------------------------------
read_csv("The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3",
    skip = 2
)


## ---------------------------------------------------------------------------------------------------
read_csv("# A comment I want to skip
  x,y,z
  1,2,3",
    comment = "#"
)


## ---------------------------------------------------------------------------------------------------
teams <- read_csv(here("data", "team_standings.csv"),
    col_types = "cc"
)


## ---------------------------------------------------------------------------------------------------
logs <- read_csv(here("data", "2016-07-19.csv.bz2"),
    n_max = 10
)


## ---------------------------------------------------------------------------------------------------
logs <- read_csv(here("data", "2016-07-19.csv.bz2"),
    col_types = "ccicccccci",
    n_max = 10
)
logs


## ---------------------------------------------------------------------------------------------------
logdates <- read_csv(here("data", "2016-07-19.csv.bz2"),
    col_types = cols_only(date = col_date()),
    n_max = 10
)
logdates


## ---------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


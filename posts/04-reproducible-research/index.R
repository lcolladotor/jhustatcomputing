## ------------------------------------------------------------------------------------------------------------------------
#| label: setup
#| include: false
library(here)


## ------------------------------------------------------------------------------------------------------------------------
#| eval: false
## install.packages(c("here", "sessioninfo"))


## ------------------------------------------------------------------------------------------------------------------------
## This is my relative directory
here::here()

## I can now easily share code to access files from this project
## such as access to the flight.csv file saved under the data
## directory.
here::here("data", "flights.csv")

## This would not be easily shareable as you don't have
## "/Users/leocollado/Dropbox/Code" on your computer
full_path <- "/Users/leocollado/Dropbox/Code/jhustatcomputing/data/flights.csv"


## ------------------------------------------------------------------------------------------------------------------------
#| eval: false
## ## Reproducibility information
## print("Reproducibility information:")
## Sys.time()
## proc.time()
## options(width = 120)
## sessioninfo::session_info()


## ------------------------------------------------------------------------------------------------------------------------
## Reproducibility information
print("Reproducibility information:")
Sys.time()
proc.time()
options(width = 120)
sessioninfo::session_info()


## ------------------------------------------------------------------------------------------------------------------------
library("colorout") ## Load a package I installed from GitHub
sessioninfo::session_info()


## ------------------------------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


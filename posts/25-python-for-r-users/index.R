## ------------------------------------------------------------------------------------------------------------------------
#| eval: false
## install.packages("reticulate")


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
library(here)
library(tidyverse)
library(reticulate)


## ------------------------------------------------------------------------------------------------------------------------
Sys.which("python3")


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## use_python("/usr/<new>/<path>/local/bin/python")


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## use_python("/opt/homebrew/Caskroom/miniforge/base/bin/python")


## ------------------------------------------------------------------------------------------------------------------------
py_discover_config()


## python3

## python3 myscript.py

## python3 --version

## 2 ** 3
## 
## x = 3
## x > 1 and x <= 5

## ------------------------------------------------------------------------------------------------------------------------
2^3

x <- 3
x > 1 & x <= 5


## print('In %d days, I have eaten %g %s.' % (5, 3.5, 'cupcakes'))

## type("Let's go Ravens!")

## print("Let's go Ravens!")

## def new_world():
##     return 'Hello world!'
## 
## print(new_world())

## def squared(x):
##     """ Return the square of a
##         value """
##     return x ** 2
## 
## print(squared(4))

## def concat(*args, sep="/"):
##  return sep.join(args)
## 
## concat("a", "b", "c")

## for i in range(3):
##   print('Baby shark, doo doo doo doo doo doo!')
## print('Baby shark!')

## x = 'Baby shark!'
## len(x)

## x = "Hello Baltimore!"
## x.split()

## dict = {"a" : 1, "b" : 2}
## dict['a']
## dict['b']

## ------------------------------------------------------------------------------------------------------------------------
# checks to see if a folder called "data" exists; if not, it installs it
if (!file.exists(here("data"))) {
    dir.create(here("data"))
}

# checks to see if a file called "flights.csv" exists; if not, it saves it to the data folder
if (!file.exists(here("data", "flights.csv"))) {
    readr::write_csv(nycflights13::flights,
        file = here("data", "flights.csv")
    )
}

nycflights13::flights %>%
    head()


## import pandas
## flights_path = "/Users/leocollado/Dropbox/Code/jhustatcomputing/data/flights.csv"
## flights = pandas.read_csv(flights_path)
## flights = flights[flights['dest'] == "ORD"]
## flights = flights[['carrier', 'dep_delay', 'arr_delay']]
## flights = flights.dropna()
## flights

## ------------------------------------------------------------------------------------------------------------------------
head(py$flights)
py$flights_path


## ------------------------------------------------------------------------------------------------------------------------
class(py$flights)
class(py$flights_path)


## ------------------------------------------------------------------------------------------------------------------------
ggplot(py$flights, aes(x = carrier, y = arr_delay)) +
    geom_point() +
    geom_jitter()


## ------------------------------------------------------------------------------------------------------------------------
library(tidyverse)
flights <- read_csv(here("data", "flights.csv")) %>%
    filter(dest == "ORD") %>%
    select(carrier, dep_delay, arr_delay) %>%
    na.omit()

flights


## r.flights.head(10)

## ------------------------------------------------------------------------------------------------------------------------
os <- import("os")
os$listdir(".")


## ----reticulate-completion, echo=FALSE, fig.cap='Using reticulate tab completion', fig.align='center'--------------------
knitr::include_graphics("https://rstudio.github.io/reticulate/images/reticulate_completion.png")


## ------------------------------------------------------------------------------------------------------------------------
pd <- import("pandas")
test <- pd$read_csv(here("data", "flights.csv"))
head(test)
class(test)


## ------------------------------------------------------------------------------------------------------------------------
skl_lr <- import("sklearn.linear_model")
skl_lr


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## source_python("secret_functions.py")
## subject_1 <- read_subject("secret_data.csv")


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## repl_python()


## ----repl-python, echo=FALSE, fig.cap='Using the repl_python() function', fig.align='center'-----------------------------
knitr::include_graphics("https://rstudio.github.io/reticulate/images/python_repl.png")


## ------------------------------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


## ------------------------------------------------------------------------------------------------------------------------
x <- 1
print(x)
x
msg <- "hello"


## ------------------------------------------------------------------------------------------------------------------------
#| error: true
x <-  ## Incomplete expression


## ------------------------------------------------------------------------------------------------------------------------
x <- 5  ## nothing printed
x       ## auto-printing occurs
print(x)  ## explicit printing


## ------------------------------------------------------------------------------------------------------------------------
#| echo: false
old <- options(width = 40)


## ------------------------------------------------------------------------------------------------------------------------
x <- 11:30
x


## ------------------------------------------------------------------------------------------------------------------------
#| echo: false
options(old)


## ------------------------------------------------------------------------------------------------------------------------
5:0
-15:15


## ------------------------------------------------------------------------------------------------------------------------
vector(mode = "numeric", length = 4)
vector(mode = "logical", length = 4)
vector(mode = "character", length = 4)


## ------------------------------------------------------------------------------------------------------------------------
x <- c(0.5, 0.6)       ## numeric
x <- c(TRUE, FALSE)    ## logical
x <- c(T, F)           ## logical
x <- c("a", "b", "c")  ## character
x <- 9:29              ## integer
x <- c(1+0i, 2+4i)     ## complex


## ------------------------------------------------------------------------------------------------------------------------
#| warning: true
typeof(4)
typeof(4L)


## ------------------------------------------------------------------------------------------------------------------------
x <- sqrt(2) ^ 2
x


## ------------------------------------------------------------------------------------------------------------------------
## try it here



## ------------------------------------------------------------------------------------------------------------------------
letters
typeof(letters)

1:10
typeof(1:10)


## ------------------------------------------------------------------------------------------------------------------------
x <- list("a", "b", 1:10)
x
length(x)
typeof(x)
attributes(x)


## ------------------------------------------------------------------------------------------------------------------------
y <- c(1.7, "a")
y <- c(TRUE, 2)
y <- c("a", TRUE)


## ------------------------------------------------------------------------------------------------------------------------
## try it here



## ------------------------------------------------------------------------------------------------------------------------
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)


## ------------------------------------------------------------------------------------------------------------------------
x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)


## ------------------------------------------------------------------------------------------------------------------------
## try it here 



## ------------------------------------------------------------------------------------------------------------------------
m <- matrix(nrow = 2, ncol = 3) 
m
dim(m)
attributes(m)


## ------------------------------------------------------------------------------------------------------------------------
m <- matrix(1:6, nrow = 2, ncol = 3) 
m


## ------------------------------------------------------------------------------------------------------------------------
## try it here 



## ------------------------------------------------------------------------------------------------------------------------
m <- 1:10 
m
dim(m) <- c(2, 5)
m


## ------------------------------------------------------------------------------------------------------------------------
x <- 1:3
y <- 10:12
cbind(x, y)


## ------------------------------------------------------------------------------------------------------------------------
## try it here 



## ------------------------------------------------------------------------------------------------------------------------
x <- list(1, "a", TRUE, 1 + 4i) 
x


## ------------------------------------------------------------------------------------------------------------------------
x <- vector("list", length = 5)
x


## ------------------------------------------------------------------------------------------------------------------------
x <- factor(c("yes", "yes", "no", "yes", "no")) 
x
table(x) 
## See the underlying representation of factor
unclass(x)  


## ------------------------------------------------------------------------------------------------------------------------
## try it here 



## ------------------------------------------------------------------------------------------------------------------------
x <- factor(c("yes", "yes", "no", "yes", "no"))
x  ## Levels are put in alphabetical order
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x


## ------------------------------------------------------------------------------------------------------------------------
## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)  
## Return a logical vector indicating which elements are NA
is.na(x)    
## Return a logical vector indicating which elements are NaN
is.nan(x)   


## ------------------------------------------------------------------------------------------------------------------------
## Now create a vector with both NA and NaN values
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)


## ------------------------------------------------------------------------------------------------------------------------
x <- data.frame(foo = 1:4, bar = c(T, T, F, F)) 
x
nrow(x)
ncol(x)
attributes(x)


## ------------------------------------------------------------------------------------------------------------------------
data.matrix(x)
attributes(data.matrix(x))


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
# try it yourself

library(tidyverse)
library(palmerpenguins)
penguins 



## ------------------------------------------------------------------------------------------------------------------------
x <- 1:3
names(x)
names(x) <- c("New York", "Seattle", "Los Angeles") 
x
names(x)
attributes(x)


## ------------------------------------------------------------------------------------------------------------------------
x <- list("Los Angeles" = 1, Boston = 2, London = 3) 
x
names(x)


## ------------------------------------------------------------------------------------------------------------------------
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d")) 
m


## ------------------------------------------------------------------------------------------------------------------------
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m


## ------------------------------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


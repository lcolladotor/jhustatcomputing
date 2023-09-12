
inches <- c(69, 62, 66, 70, 70, 73, 67, 73, 67, 70)



inches * 2.54



inches - 69



x <- 1:10
y <- 1:10
x + y



x <- 1:10
sqrt(x)



y <- 1:10
x * y



lapply



x <- list(a = 1:5, b = rnorm(10))
x
lapply(x, mean)



x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)



x <- 1:4
lapply(x, runif)



x <- 1:4
lapply(x, runif, min = 0, max = 10)



x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x



lapply(x, function(elt) {
    elt[, 1]
})



f <- function(elt) {
    elt[, 1]
}
lapply(x, f)



x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)



sapply(x, mean)



str(split)



x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10) # generate factor levels
f



split(x, f)



lapply(split(x, f), mean)



library(datasets)
head(airquality)



s <- split(airquality, airquality$Month)
str(s)



lapply(s, function(x) {
    colMeans(x[, c("Ozone", "Solar.R", "Wind")])
})



sapply(s, function(x) {
    colMeans(x[, c("Ozone", "Solar.R", "Wind")])
})



sapply(s, function(x) {
    colMeans(x[, c("Ozone", "Solar.R", "Wind")],
        na.rm = TRUE
    )
})



str(tapply)



## Simulate some data
x <- c(rnorm(10), runif(10), rnorm(10, 1))
## Define some groups with a factor variable
f <- gl(3, 10)
f
tapply(x, f, mean)



tapply(x, f, range)



str(apply)



x <- matrix(rnorm(200), 20, 10)
head(x)
apply(x, 2, mean) ## Take the mean of each column



apply(x, 1, sum) ## Take the mean of each row


#| eval: false
## apply(x, 2, mean)


#| eval: false
## apply(x, 1, mean)



x <- matrix(rnorm(200), 20, 10)
head(x)

## Get row quantiles
apply(x, 1, quantile, probs = c(0.25, 0.75))



sumsq <- function(mu, sigma, x) {
    sum(((x - mu) / sigma)^2)
}



x <- rnorm(100) ## Generate some data
sumsq(mu = 1, sigma = 1, x) ## This works (returns one value)



sumsq(1:10, 1:10, x) ## This is not what we want



vsumsq <- Vectorize(sumsq, c("mu", "sigma"))
vsumsq(1:10, 1:10, x)



options(width = 120)
sessioninfo::session_info()


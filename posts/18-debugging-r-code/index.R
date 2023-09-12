
library(reprex)


#| eval: false
## (y <- 1:4)
## mean(y)


#| warning: true
log(-1)



print_message <- function(x) {
    if (x > 0) {
        print("x is greater than zero")
    } else {
        print("x is less than or equal to zero")
    }
    invisible(x)
}


#| error: true
print_message(1)


#| error: true
print_message(NA)



print_message2 <- function(x) {
    if (is.na(x)) {
        print("x is a missing value!")
    } else if (x > 0) {
        print("x is greater than zero")
    } else {
        print("x is less than or equal to zero")
    }
    invisible(x)
}



print_message2(NA)


#| error: true
x <- log(c(-1, 2))
print_message2(x)



print_message3 <- function(x) {
    if (length(x) > 1L) {
        stop("'x' has length > 1")
    }
    if (is.na(x)) {
        print("x is a missing value!")
    } else if (x > 0) {
        print("x is greater than zero")
    } else {
        print("x is less than or equal to zero")
    }
    invisible(x)
}


#| error: true
print_message3(1:2)



print_message4 <- Vectorize(print_message2)
out <- print_message4(c(-1, 2))



f <- function(a) g(a)
g <- function(b) h(b)
h <- function(c) i(c)
i <- function(d) {
    if (!is.numeric(d)) {
        stop("`d` must be numeric", call. = FALSE)
    }
    d + 10
}
f("a")



options(width = 120)
sessioninfo::session_info()


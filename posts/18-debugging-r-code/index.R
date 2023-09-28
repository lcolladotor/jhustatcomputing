## ---------------------------------------------------------------------------------
#| eval: false
## remotes::install_github("jalvesaq/colorout")


## ---------------------------------------------------------------------------------
#| eval: false

## ## Open your .Rprofile file
## usethis::edit_r_profile()
## 
## ## Copy paste the following code taken from
## ## https://lcolladotor.github.io/bioc_team_ds/config-files.html#rprofile
## 
## ## Change colors
## # Source https://github.com/jalvesaq/colorout
## if (Sys.getenv("TERM") %in% c("term", "xterm-256color", "cygwin", "screen")) {
##     if (!requireNamespace("colorout", quietly = TRUE) & .Platform$OS.type != "windows") {
##         cat('To install colorout use: remotes::install_github("jalvesaq/colorout")\n')
##     }
## }


## ---------------------------------------------------------------------------------
#| warning: true
#| error: true
require("colorout")

## From colorout's README documentation
x <- data.frame(
    logic = c(TRUE, TRUE, FALSE),
    factor = factor(c("abc", "def", "ghi")),
    string = c("ABC", "DEF", "GHI"),
    real = c(1.23, -4.56, 7.89),
    cien.not = c(1.234e-23, -4.56 + 45, 7.89e78),
    date = as.Date(c("2012-02-21", "2013-02-12", "2014-03-04"))
)
rownames(x) <- seq_len(3)
x

summary(x[, c(1, 2, 4, 6)])

warning("This is an example of a warning.")

example.of.error

library("KernSmooth")

colorout::setOutputColors()


## ---------------------------------------------------------------------------------
library("reprex")


## ---------------------------------------------------------------------------------
#| eval: false
## (y <- 1:4)
## mean(y)


## ---------------------------------------------------------------------------------
#| warning: true
log(-1)


## ---------------------------------------------------------------------------------
print_message <- function(x) {
    if (x > 0) {
        print("x is greater than zero")
    } else {
        print("x is less than or equal to zero")
    }
    invisible(x)
}


## ---------------------------------------------------------------------------------
#| error: true
print_message(1)


## ---------------------------------------------------------------------------------
#| error: true
print_message(NA)


## ---------------------------------------------------------------------------------
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


## ---------------------------------------------------------------------------------
print_message2(NA)


## ---------------------------------------------------------------------------------
#| error: true
x <- log(c(-1, 2))
print_message2(x)


## ---------------------------------------------------------------------------------
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


## ---------------------------------------------------------------------------------
#| error: true
print_message3(1:2)


## ---------------------------------------------------------------------------------
print_message3_no_call <- function(x) {
    if (length(x) > 1L) {
        stop("'x' has length > 1", call. = FALSE)
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


## ---------------------------------------------------------------------------------
#| error: true
print_message3_no_call(99:100)
print_message3(99:100)


## ---------------------------------------------------------------------------------
print_message3_tidyverse <- function(x) {
    if (length(x) > 1L) {
        rlang::abort("'x' has length > 1")
    }
    if (is.na(x)) {
        rlang::warn("x is a missing value!")
    } else if (x > 0) {
        rlang::inform("x is greater than zero")
    } else {
        rlang::inform("x is less than or equal to zero")
    }
    invisible(x)
}


## ---------------------------------------------------------------------------------
#| error: true
print_message3_tidyverse(99:100)
print_message3_tidyverse(NA)
print_message3_tidyverse(1)
print_message3_tidyverse(-1)


## ---------------------------------------------------------------------------------
print_message3_cli <- function(x) {
    if (length(x) > 1L) {
        len <- length(x)

        ## Avoid the print() calls from
        ## https://github.com/ComunidadBioInfo/praiseMX/blob/master/R/praise_crear_emi.R
        praise_mx_log <- capture.output({
            praise_mx <- praiseMX:::praise_bien()
        })
        cli::cli_abort(
            c(
                "This function is not vectorized:",
                "i" = "{.var x} has length {len}.",
                "x" = "{.var x} must have length 1.",
                ">" = "Try using {.code purrr::map(x, print_message3_cli)} to loop your input {.var x} on this function.",
                "v" = praise::praise(),
                "v" = praise_mx
            )
        )
    }
    if (is.na(x)) {
        rlang::warn("x is a missing value!")
    } else if (x > 0) {
        rlang::inform("x is greater than zero")
    } else {
        rlang::inform("x is less than or equal to zero")
    }
    invisible(x)
}


## ---------------------------------------------------------------------------------
#| error: true
set.seed(20230928)
print_message3_cli(-1:1)
purrr::map(-1:1, print_message3_cli)


## ---------------------------------------------------------------------------------
print_message4 <- Vectorize(print_message2)
out <- print_message4(c(-1, 2))


## ---------------------------------------------------------------------------------
#| error: true
lm(y ~ x)
rlang::last_error()


## ----error=TRUE-------------------------------------------------------------------
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


## ---------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


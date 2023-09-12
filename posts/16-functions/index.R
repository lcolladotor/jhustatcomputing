
f <- function() {
    ## This is an empty function
}
## Functions have their own class
class(f)
## Execute this function
f()



f <- function() {
    # this is the function body
    hello <- "Hello, world!\n"
    cat(hello)
}
f()



hello <- "Hello, world!\n"

print(hello)
cat(hello)



f <- function(num) {
    for (i in seq_len(num)) {
        hello <- "Hello, world!\n"
        cat(hello)
    }
}
f(3)



f <- function(num) {
    hello <- "Hello, world!\n"
    for (i in seq_len(num)) {
        cat(hello)
    }
    chars <- nchar(hello) * num
    chars
}
meaningoflife <- f(3)
print(meaningoflife)


#| error: true
f()



f <- function(num = 1) {
    hello <- "Hello, world!\n"
    for (i in seq_len(num)) {
        cat(hello)
    }
    chars <- nchar(hello) * num
    chars
}


f() ## Use default value for 'num'
f(2) ## Use user-specified value



formals(f)



f(num = 2)



str(rnorm)
mydata <- rnorm(100, 2, 1) ## Generate some data



## Positional match first argument, default for 'na.rm'
sd(mydata)
## Specify 'x' argument by name, default for 'na.rm'
sd(x = mydata)
## Specify both arguments by name
sd(x = mydata, na.rm = FALSE)



## Specify both arguments by name
sd(na.rm = FALSE, x = mydata)



sd(na.rm = FALSE, mydata)



args(f)



args(lm)



f <- function(a, b) {
    a^2
}
f(2)


#| error: true
f <- function(a, b) {
    print(a)
    print(b)
}
f(45)



mean



paste("one", "two", "three")
paste("one", "two", "three", "four", "five", sep = "_")



args(paste)



args(paste)



paste("a", "b", sep = ":")



paste("a", "b", se = ":")


#| eval: false
## # Too short
## f()
## 
## # Not a verb, or descriptive
## my_awesome_function()
## 
## # Long, but clear
## impute_missing()
## collapse_years()



# Never do this!
col_mins <- function(x, y) {}
rowMaxes <- function(x, y) {}


#| eval: false
## # Good
## input_select()
## input_checkbox()
## input_text()
## 
## # Not so good
## select_input()
## checkbox_input()
## text_input()


#| eval: false
## # Don't do this!
## T <- FALSE
## c <- 10
## mean <- function(x) sum(x)



f <- function(x) {
    x + y
}



y <- 100
f(10)

y <- 1000
f(10)



`+` <- function(x, y) {
    if (runif(1) < 0.1) {
        sum(x, y)
    } else {
        sum(x, y) * 1.1
    }
}
table(replicate(1000, 1 + 2))



rm(`+`)


#| eval: false
## mean(is.na(x))
## 
## x / sum(x, na.rm = TRUE)



options(width = 120)
sessioninfo::session_info()


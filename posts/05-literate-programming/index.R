
data(airquality)
plot(airquality$Ozone ~ airquality$Wind)



knitr::include_graphics("https://d33wubrfki0l68.cloudfront.net/61d189fd9cdf955058415d3e1b28dd60e1bd7c9b/9791d/images/rmarkdownflow.png")


#| label: missionaccomplished
#| echo: false
#| out-width: '60%'
#| fig-cap: "Mission accomplished!"
knitr::include_graphics("https://media.giphy.com/media/L4ZZNbDpOCfiX8uYSd/giphy.gif")


#| label: hex-blogdown
#| echo: false
#| out-width: '30%'
#| fig-cap: "blogdown logo"
knitr::include_graphics("https://bookdown.org/yihui/blogdown/images/logo.png")


#| label: hex-bookdown
#| echo: false
#| out-width: '30%'
#| fig-cap: "book logo"
knitr::include_graphics("https://bookdown.org/yihui/bookdown/images/logo.png")



## library(package)



## matrix(data, nrow = rows, ncol = cols)



## if (condition) {
##     ## Case 1
## } else if (condition) {
##     ## Case 2
## } else if (condition) {
##     ## Case 3
## }



## name <- function(variables) {
## 
## }



## for (variable in vector) {
## 
## }



## # Tue Jan 21 20:20:14 2020 ------------------------------


#| eval: false
## ## Install styler for automatically styling scripts
## install.packages("styler")
## 
## ## Install biocthis
## if (!require("BiocManager", quietly = TRUE))
##     install.packages("BiocManager")
## 
## BiocManager::install("biocthis")



## Example code for styling all files that end with .qmd
cat(readLines(here::here("scripts", "auto_style.R")))


#| eval: false
## ## For the styler addin
## # Affects the output of: styler:::get_addins_style_transformer_name()
## # https://github.com/r-lib/styler/blob/acfb42acc2e558e7b57ef133f1470df78b5093fd/R/addins.R#L183
## options("styler.addins_style_transformer" = "biocthis::bioc_style()")



options(width = 120)
sessioninfo::session_info()


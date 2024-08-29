## --------------------------------------------------
#| label: versioncontrol
#| echo: false
#| fig-cap: 'How not to use GitHub [image from PhD Comics]'
#| out-width: '80%'
knitr::include_graphics("../../images/phdversioncontrol.gif")


## --------------------------------------------------
#| label: happygitwithr
#| echo: false
#| fig-cap: 'A screenshot of the Happy Git with R online book from Jenny Bryan'
#| out-width: '80%'
knitr::include_graphics("../../images/happygitwithr.png")


## --------------------------------------------------
#| eval: false
## ## Install "usethis" if you don't have it already
## if (!requireNamespace("usethis", quietly = TRUE)) {
##     install.packages("usethis")
## }
## 
## usethis::create_project("~/Desktop/biostat776classnotes")
## 
## ## Then in your new RStudio project, run the following:
## usethis::use_git()
## usethis::use_github()


## --------------------------------------------------
#| eval: false
## install.packages("reprex")


## --------------------------------------------------
options(width = 120)
sessioninfo::session_info()


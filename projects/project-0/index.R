## --------------------------------------------------------------------------------
#| eval: false
## install.packages(
##     c("postcards", "usethis", "gitcreds")
## )


## --------------------------------------------------------------------------------
#| label: rv
#| eval: false
#| echo: true
## print(R.version.string)


## ----rstudiov, eval = FALSE, echo = TRUE-----------------------------------------
## print(RStudio.Version()$version)


## git --version

## --------------------------------------------------------------------------------
#| eval: false
## ## My GitHub username is "lcolladotor", so this would create the RStudio project
## ## on my Desktop
## usethis::create_project("~/Desktop/lcolladotor.github.io")


## --------------------------------------------------------------------------------
#| eval: false
## usethis::create_project("~/Desktop/biostat776-intro-Leonardo-ColladoTorres")


## --------------------------------------------------------------------------------
#| eval: false
## usethis::use_git() ## Choose the option to make the commit, then to restart RStudio
## ## If you don't have git installed, you will likely benefit from reading
## ## "Happy Git and GitHub for the useR" at https://happygitwithr.com/.


## --------------------------------------------------------------------------------
#| eval: false
## ## After the restart, we next need to change the default Git branch to "gh-pages".
## ## This will make our lives a bit easier later on, as this specific name is used by
## ## GitHub pages https://pages.github.com/ for websites.
## usethis::git_default_branch_rename(to = "gh-pages")


## --------------------------------------------------------------------------------
#| eval: false
## ## We will next link R to GitHub so R can act on your behalf. We will create a
## ## GitHub Personal Access Token (PAT) so R can say that it's acting on your behalf.
## ## This function guides us through the full process:
## 
## usethis::gh_token_help()
## ## The above command will suggest that you read more at
## ## https://usethis.r-lib.org/articles/articles/git-credentials.html
## ## which contains the latest recommendations by the usethis authors for
## ## configuring your R to GitHub connection.
## usethis::create_github_token()
## gitcreds::gitcreds_set()
## ## Type your GitHub token, not your password! Otherwise you might run into this
## ## problem: https://github.com/r-lib/usethis/issues/1347
## 
## ## In some situations, gitcreds::gitcreds_set() might not work. For example,
## ## gitcreds::gitcreds_set() is not supported on Linux as discussed at
## ## https://github.com/r-lib/gitcreds/issues/29. In these situations,
## ## you have to rely on the old workflow of editing your
## ## .Renviron file with contents like (note the empty line at the end!):
## # GITHUB_PAT=YOUR_40_CHARACTERS_TOKEN
## #
## usethis::edit_r_environ()
## ## Then re-start your R session.
## rstudioapi::restartSession()
## ## Editing the .Renviron is strongly discouraged now since it stores as
## ## simple text your GitHub personal access token (PAT) instead of the
## ## more secure approach provided by gitcreds.


## --------------------------------------------------------------------------------
#| eval: false
## ## Next we continue by connecting your local git repository to
## ## GitHub. For other scenarios, you might want to use the `organisation`
## ## and `private` arguments
## args(usethis::use_github)
## 
## ## Now run use_github()
## usethis::use_github()


## --------------------------------------------------------------------------------
#| eval: false
## postcards::create_postcard(template = "jolla")
## postcards::create_postcard(template = "jolla-blue")
## postcards::create_postcard(template = "trestles")
## postcards::create_postcard(template = "onofre")
## postcards::create_postcard(template = "solana")


## --------------------------------------------------------------------------------
#| eval: false
## ## Create an Rstudio project
## usethis::create_project("~/Desktop/biostat776classnotes")
## 
## ## Start version controlling it
## usethis::use_git()
## 
## ## Share it via GitHub with the world
## usethis::use_github()


## --------------------------------------------------------------------------------
#| eval: false
## ## Create an Rstudio project
## usethis::create_project("~/Desktop/biostat776project1")
## 
## ## Start version controlling it
## usethis::use_git()
## 
## ## Use the gh-pages branch in order for
## ## GitHub pages https://pages.github.com/ to
## ## host our website.
## usethis::git_default_branch_rename(to = "gh-pages")
## 
## ## Create a .nojekyll file
## writeLines("", here::here(".nojekyll"))
## 
## ## Share it via GitHub with the world
## usethis::use_github()


## --------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


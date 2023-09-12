qmds <-
    list.files(
        path = here::here(),
        pattern = "\\.qmd$",
        full.names = TRUE,
        recursive = TRUE
    )
sapply(qmds, function(q) {
    knitr::knit(q, gsub(".qmd", ".R", q), tangle = TRUE)
})

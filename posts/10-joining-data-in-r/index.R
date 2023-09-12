
library(tidyverse)

outcomes <- tibble(
    id = rep(c("a", "b", "c"), each = 3),
    visit = rep(0:2, 3),
    outcome = rnorm(3 * 3, 3)
)

print(outcomes)



subjects <- tibble(
    id = c("a", "b", "c"),
    house = c("detached", "rowhouse", "rowhouse")
)

print(subjects)


#| echo: false
#| out-width: '60%'
#| fig-align: 'center'
library(knitr)
join_funcs <- data.frame(
    func = c(
        "`left_join()`",
        "`right_join()`",
        "`inner_join()`",
        "`full_join()`"
    ),
    does = c(
        "Includes all observations in the left data frame, whether or not there is a match in the right data frame",
        "Includes all observations in the right data frame, whether or not there is a match in the left data frame",
        "Includes only observations that are in both data frames",
        "Includes all observations from both data frames"
    )
)
knitr::kable(join_funcs, col.names = c("Function", "What it includes in merged data frame"))



outcomes
subjects



left_join(x = outcomes, y = subjects, by = "id")



subjects <- tibble(
    id = c("a", "b", "c"),
    visit = c(0, 1, 0),
    house = c("detached", "rowhouse", "rowhouse"),
)

print(subjects)



left_join(outcomes, subjects, by = c("id", "visit"))



subjects <- tibble(
    id = c("b", "c"),
    visit = c(1, 0),
    house = c("rowhouse", "rowhouse"),
)

subjects



left_join(x = outcomes, y = subjects, by = c("id", "visit"))



inner_join(x = outcomes, y = subjects, by = c("id", "visit"))



right_join(x = outcomes, y = subjects, by = c("id", "visit"))



# Create first example data frame
df1 <- data.frame(
    ID = 1:3,
    X1 = c("a1", "a2", "a3")
)
# Create second example data frame
df2 <- data.frame(
    ID = 2:4,
    X2 = c("b1", "b2", "b3")
)



options(width = 120)
sessioninfo::session_info()


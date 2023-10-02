## -----------------------------------------------------------------------------------
x <- c("Dec", "Apr", "Jan", "Mar")


## -----------------------------------------------------------------------------------
x_typo <- c("Dec", "Apr", "Jam", "Mar")


## -----------------------------------------------------------------------------------
sort(x)


## -----------------------------------------------------------------------------------
month_levels <- c(
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)


## -----------------------------------------------------------------------------------
y <- factor(x, levels = month_levels)
y


## -----------------------------------------------------------------------------------
sort(y)


## -----------------------------------------------------------------------------------
attributes(y)


## -----------------------------------------------------------------------------------
levels(y)


## -----------------------------------------------------------------------------------
y_typo <- factor(x_typo, levels = month_levels)
y_typo


## -----------------------------------------------------------------------------------
#| message: false
library(tidyverse)

x1_original <- c(10, 10, 10, 50, 60, 20, 20, 40)
x1_factor <- factor(x1_original)
attributes(x1_factor)

tibble(x1_original, x1_factor) %>%
    mutate(x1_numeric = as.numeric(x1_factor))


## -----------------------------------------------------------------------------------
#| warning: true
as.numeric(c("hello"))
as.numeric(factor(c("hello")))


## -----------------------------------------------------------------------------------
#| warning: true
as.numeric(factor(c("hello", "goodbye")))


## -----------------------------------------------------------------------------------
factor("a", levels = "c")


## -----------------------------------------------------------------------------------
income_level <- c(
    rep("low", 10),
    rep("medium", 10),
    rep("high", 10)
)
income_level


## -----------------------------------------------------------------------------------
x <- factor(income_level)
x

y <- rnorm(30) # generate some random obs from a normal dist
lm(y ~ x)


## -----------------------------------------------------------------------------------
income_level <- c(
    rep("low", 10000),
    rep("medium", 10000),
    rep("high", 10000)
)


## -----------------------------------------------------------------------------------
format(object.size(income_level), units = "Kb") # size of the character string
format(object.size(factor(income_level)), units = "Kb") # size of the factor


## -----------------------------------------------------------------------------------
library("forcats")


## -----------------------------------------------------------------------------------
gss_cat


## -----------------------------------------------------------------------------------
gss_cat %>%
    count(race)


## -----------------------------------------------------------------------------------
#| fig-alt: >
#|   A bar chart showing the distribution of race. There are ~2000
#|   records with race "Other", 3000 with race "Black", and other
#|   15,000 with race "White".
gss_cat %>%
    ggplot(aes(x = race)) +
    geom_bar()


## -----------------------------------------------------------------------------------
gss_cat %>%
    count(relig)


## -----------------------------------------------------------------------------------
attributes(gss_cat$relig)


## -----------------------------------------------------------------------------------
#| fig-alt: >
#|   A scatterplot of with tvhours on the x-axis and religion on the y-axis.
#|   The y-axis is ordered seemingly aribtrarily making it hard to get
#|   any sense of overall pattern.
relig_summary <- gss_cat %>%
    group_by(relig) %>%
    summarise(
        tvhours = mean(tvhours, na.rm = TRUE),
        n = n()
    )

relig_summary %>%
    ggplot(aes(x = tvhours, y = relig)) +
    geom_point()


## -----------------------------------------------------------------------------------
#| fig-alt: >
#|   The same scatterplot as above, but now the religion is displayed in
#|   increasing order of tvhours. "Other eastern" has the fewest tvhours
#|   under 2, and "Don't know" has the highest (over 5).
relig_summary %>%
    ggplot(aes(
        x = tvhours,
        y = fct_reorder(.f = relig, .x = tvhours)
    )) +
    geom_point()


## -----------------------------------------------------------------------------------
relig_summary %>%
    mutate(relig = fct_reorder(relig, tvhours)) %>%
    ggplot(aes(x = tvhours, y = relig)) +
    geom_point()


## -----------------------------------------------------------------------------------
#| fig-alt: >
#|   A scatterplot with age on the x-axis and income on the y-axis. Income
#|   has been reordered in order of average age which doesn't make much
#|   sense. One section of the y-axis goes from $6000-6999, then <$1000,
#|   then $8000-9999.
rincome_summary <-
    gss_cat %>%
    group_by(rincome) %>%
    summarise(
        age = mean(age, na.rm = TRUE),
        n = n()
    )

## Original rincome order
rincome_summary %>%
    ggplot(aes(x = age, y = rincome)) +
    geom_point()

## rincome re-ordered by age's values
rincome_summary %>%
    ggplot(aes(x = age, y = fct_reorder(.f = rincome, .x = age))) +
    geom_point()


## -----------------------------------------------------------------------------------
library(palmerpenguins)
penguins

## Try it out


## -----------------------------------------------------------------------------------
#| fig-alt: >
#|   The same scatterplot but now "Not Applicable" is displayed at the
#|   bottom of the y-axis. Generally there is a positive association
#|   between income and age, and the income band with the highest average
#|   age is "Not applicable".
rincome_summary %>%
    ggplot(aes(age, fct_relevel(rincome, "Not applicable"))) +
    geom_point()


## -----------------------------------------------------------------------------------
#| layout-ncol: 2
#| fig-width: 4
#| fig-height: 2
#| fig-alt: >
#|   - A line plot with age on the x-axis and proportion on the y-axis.
#|     There is one line for each category of marital status: no answer,
#|     never married, separated, divorced, widowed, and married. It is
#|     a little hard to read the plot because the order of the legend is
#|     unrelated to the lines on the plot.
#|   - Rearranging the legend makes the plot easier to read because the
#|     legend colours now match the order of the lines on the far right
#|     of the plot. You can see some unsuprising patterns: the proportion
#|     never marred decreases with age, married forms an upside down U
#|     shape, and widowed starts off low but increases steeply after age
#|     60.
by_age <-
    gss_cat %>%
    filter(!is.na(age)) %>%
    count(age, marital) %>%
    group_by(age) %>%
    mutate(prop = n / sum(n))

by_age %>%
    ggplot(aes(age, prop, colour = marital)) +
    geom_line(na.rm = TRUE)

by_age %>%
    ggplot(aes(age, prop, colour = fct_reorder2(marital, age, prop))) +
    geom_line() +
    labs(colour = "marital")


## -----------------------------------------------------------------------------------
#| fig-alt: >
#|   A bar char of marital status ordered in from least to most common:
#|   no answer (~0), separated (~1,000), widowed (~2,000), divorced
#|   (~3,000), never married (~5,000), married (~10,000).
gss_cat %>%
    mutate(marital = marital %>% fct_infreq() %>% fct_rev()) %>%
    ggplot(aes(marital)) +
    geom_bar()


## -----------------------------------------------------------------------------------
gss_cat %>%
    count(partyid)


## -----------------------------------------------------------------------------------
gss_cat %>%
    mutate(partyid = fct_recode(partyid,
        "Republican, strong"    = "Strong republican",
        "Republican, weak"      = "Not str republican",
        "Independent, near rep" = "Ind,near rep",
        "Independent, near dem" = "Ind,near dem",
        "Democrat, weak"        = "Not str democrat",
        "Democrat, strong"      = "Strong democrat"
    )) %>%
    count(partyid)


## -----------------------------------------------------------------------------------
gss_cat %>%
    mutate(partyid = fct_recode(partyid,
        "Republican, strong"    = "Strong republican",
        "Republican, weak"      = "Not str republican",
        "Independent, near rep" = "Ind,near rep",
        "Independent, near dem" = "Ind,near dem",
        "Democrat, weak"        = "Not str democrat",
        "Democrat, strong"      = "Strong democrat",
        "Other"                 = "No answer",
        "Other"                 = "Don't know",
        "Other"                 = "Other party"
    )) %>%
    count(partyid)


## -----------------------------------------------------------------------------------
gss_cat %>%
    mutate(partyid = fct_collapse(partyid,
        "other" = c("No answer", "Don't know", "Other party"),
        "rep" = c("Strong republican", "Not str republican"),
        "ind" = c("Ind,near rep", "Independent", "Ind,near dem"),
        "dem" = c("Not str democrat", "Strong democrat")
    )) %>%
    count(partyid)


## -----------------------------------------------------------------------------------
gss_cat %>%
    mutate(relig = fct_lump_lowfreq(relig)) %>%
    count(relig)


## -----------------------------------------------------------------------------------
gss_cat %>%
    mutate(relig = fct_lump_n(relig, n = 10)) %>%
    count(relig, sort = TRUE) %>%
    print(n = Inf)


## -----------------------------------------------------------------------------------
ordered(c("a", "b", "c"))


## -----------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


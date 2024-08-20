## ------------------------------------------------------------------------------------------------------------------------
#| message: false
library("tidyverse")
library("here")
maacs <- read_csv(here("data", "bmi_pm25_no2_sim.csv"),
    col_types = "nnci"
)
maacs


## ------------------------------------------------------------------------------------------------------------------------
g <- ggplot(maacs, aes(
    x = logpm25,
    y = NocturnalSympt
))
summary(g)
class(g)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Nothing to see here!"
g <- maacs %>%
    ggplot(aes(logpm25, NocturnalSympt))
print(g)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Scatterplot of PM2.5 and days with nocturnal symptoms"
g <- maacs %>%
    ggplot(aes(logpm25, NocturnalSympt))
g + geom_point()


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Scatterplot with smoother"
#| message: false
g +
    geom_point() +
    geom_smooth()


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Scatterplot with linear regression line"
#| message: false
g +
    geom_point() +
    geom_smooth(method = "lm")


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself

library("palmerpenguins")
penguins


## ------------------------------------------------------------------------------------------------------------------------
#| fig-width: 9
#| fig-cap: "Scatterplot of PM2.5 and nocturnal symptoms by BMI category"
#| message: false
g +
    geom_point() +
    geom_smooth(method = "lm") +
    facet_grid(. ~ bmicat)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Modifying point color with a constant"
g + geom_point(color = "steelblue", size = 4, alpha = 1 / 2)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Mapping color to a variable"
g + geom_point(aes(color = bmicat), size = 4, alpha = 1 / 2)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Customizing a smoother"
#| message: false
g +
    geom_point(aes(color = bmicat),
        size = 2,
        alpha = 1 / 2
    ) +
    geom_smooth(
        linewidth = 4,
        linetype = 3,
        method = "lm",
        se = FALSE
    )


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Modifying the theme for a plot"
g +
    geom_point(aes(color = bmicat)) +
    theme_bw(base_family = "Times")


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself

library("palmerpenguins")
penguins


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Modifying plot labels"
g +
    geom_point(aes(color = bmicat)) +
    labs(title = "MAACS Cohort") +
    labs(
        x = expression("log " * PM[2.5]),
        y = "Nocturnal Symptoms"
    )


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Time series plot with base graphics"
testdat <- data.frame(
    x = 1:100,
    y = rnorm(100)
)
testdat[50, 2] <- 100 ## Outlier!
plot(testdat$x,
    testdat$y,
    type = "l",
    ylim = c(-3, 3)
)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Time series plot with default settings"
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Time series plot with modified ylim"
g +
    geom_line() +
    ylim(-3, 3)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Time series plot with restricted y-axis range"
g +
    geom_line() +
    coord_cartesian(ylim = c(-3, 3))


## ------------------------------------------------------------------------------------------------------------------------
#| eval: false
## ## Install bbplot
## remotes::install_github("bbc/bbplot")


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
#| fig-width: 13
## Basic ggplot2 object with our data
g <- maacs %>%
    ggplot(aes(logpm25, NocturnalSympt))

## A plot we made before, but this time without the SE lines
g +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    facet_grid(. ~ bmicat)

## Now let's add bbplot::bbc_style()
g +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    facet_grid(. ~ bmicat) +
    bbplot::bbc_style()


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
#| fig-width: 13
g +
    geom_point() +
    geom_smooth(colour = "#1380A1", method = "lm", se = FALSE) +
    facet_grid(. ~ bmicat) +
    bbplot::bbc_style() +
    labs(
        title = "Child asthma's link to air quality worsens in overweight children",
        subtitle = "Number of days with symptoms vs PM2.5 by weight group"
    )


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
#| fig-width: 13
g +
    geom_smooth(aes(colour = bmicat), method = "lm", se = FALSE, linewidth = 2) +
    scale_colour_manual(values = c("#FAAB18", "#1380A1")) +
    bbplot::bbc_style() +
    labs(
        title = "Child asthma's link to air quality worsens in overweight children",
        subtitle = "Number of days with symptoms vs PM2.5 by weight group"
    )


## ------------------------------------------------------------------------------------------------------------------------
#| eval: false
## ## Install ThemePark from GitHub
## remotes::install_github("MatthewBJane/theme_park")


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
#| fig-width: 13
## Barbie-inspired theme
g +
    geom_smooth(aes(colour = bmicat), method = "lm", se = FALSE, linewidth = 2) +
    scale_colour_manual(values = c("#FAAB18", "#1380A1")) +
    ThemePark::theme_barbie() +
    labs(
        title = "Child asthma's link to air quality worsens in overweight children",
        subtitle = "Number of days with symptoms vs PM2.5 by weight group"
    )

## Oppenheimer-inspired theme
g +
    geom_smooth(aes(colour = bmicat), method = "lm", se = FALSE, linewidth = 2) +
    scale_colour_manual(values = c("#FAAB18", "#1380A1")) +
    ThemePark::theme_oppenheimer() +
    labs(
        title = "Child asthma's link to air quality worsens in overweight children",
        subtitle = "Number of days with symptoms vs PM2.5 by weight group"
    )


## ------------------------------------------------------------------------------------------------------------------------
#| eval: false
## ## Install ggthemes from CRAN
## install.packages("ggthemes")


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
## Your favorite statistics class theme ;)
## I bet that you could fool a few people into thinking
## that you are not using R ^_^'
g +
    geom_smooth(aes(colour = bmicat), method = "lm", se = FALSE, linewidth = 2) +
    scale_colour_manual(values = c("#FAAB18", "#1380A1")) +
    ggthemes::theme_stata() +
    labs(
        title = "Child asthma's link to air quality worsens in overweight children",
        subtitle = "Number of days with symptoms vs PM2.5 by weight group"
    )


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
## Save our plot into an object
g_complete <- g +
    geom_point(aes(colour = bmicat)) +
    geom_smooth(aes(colour = bmicat), method = "lm", se = FALSE, linewidth = 2) +
    scale_colour_manual(values = c("#FAAB18", "#1380A1"))

## Make it interactive with plotly::ggplotly()
plotly::ggplotly((g_complete))


## ------------------------------------------------------------------------------------------------------------------------
#| eval: false
## ## Install colorblindr from GitHub
## remotes::install_github("clauswilke/colorblindr")


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
colorblindr::cvd_grid(g_complete)


## ------------------------------------------------------------------------------------------------------------------------
cutpoints <- quantile(maacs$logno2_new, seq(0, 1, length = 4), na.rm = TRUE)


## ------------------------------------------------------------------------------------------------------------------------
maacs$no2tert <- cut(maacs$logno2_new, cutpoints)


## ------------------------------------------------------------------------------------------------------------------------
## See the levels of the newly created factor variable
levels(maacs$no2tert)


## ----fig.cap="PM2.5 and nocturnal symptoms by BMI category and NO2 tertile",fig.width=9, fig.height=5--------------------
## Setup ggplot with data frame
g <- maacs %>%
    ggplot(aes(logpm25, NocturnalSympt))

## Add layers
g + geom_point(alpha = 1 / 3) +
    facet_grid(bmicat ~ no2tert) +
    geom_smooth(method = "lm", se = FALSE, col = "steelblue") +
    theme_bw(base_family = "Avenir", base_size = 10) +
    labs(x = expression("log " * PM[2.5])) +
    labs(y = "Nocturnal Symptoms") +
    labs(title = "MAACS Cohort")


## ------------------------------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


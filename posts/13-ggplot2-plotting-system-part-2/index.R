#| message: false
library(tidyverse)
library(here)
maacs <- read_csv(here("data", "bmi_pm25_no2_sim.csv"),
    col_types = "nnci"
)
maacs



g <- ggplot(maacs, aes(
    x = logpm25,
    y = NocturnalSympt
))
summary(g)
class(g)


#| fig-cap: "Nothing to see here!"
g <- maacs %>%
    ggplot(aes(logpm25, NocturnalSympt))
print(g)


#| fig-cap: "Scatterplot of PM2.5 and days with nocturnal symptoms"
g <- maacs %>%
    ggplot(aes(logpm25, NocturnalSympt))
g + geom_point()


#| fig-cap: "Scatterplot with smoother"
#| message: false
g +
    geom_point() +
    geom_smooth()


#| fig-cap: "Scatterplot with linear regression line"
#| message: false
g +
    geom_point() +
    geom_smooth(method = "lm")



# try it yourself

library(palmerpenguins)
penguins


#| fig-width: 9
#| fig-cap: "Scatterplot of PM2.5 and nocturnal symptoms by BMI category"
#| message: false
g +
    geom_point() +
    geom_smooth(method = "lm") +
    facet_grid(. ~ bmicat)


#| fig-cap: "Modifying point color with a constant"
g + geom_point(color = "steelblue", size = 4, alpha = 1 / 2)


#| fig-cap: "Mapping color to a variable"
g + geom_point(aes(color = bmicat), size = 4, alpha = 1 / 2)


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


#| fig-cap: "Modifying the theme for a plot"
g +
    geom_point(aes(color = bmicat)) +
    theme_bw(base_family = "Times")



# try it yourself

library(palmerpenguins)
penguins


#| fig-cap: "Modifying plot labels"
g +
    geom_point(aes(color = bmicat)) +
    labs(title = "MAACS Cohort") +
    labs(
        x = expression("log " * PM[2.5]),
        y = "Nocturnal Symptoms"
    )


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


#| fig-cap: "Time series plot with default settings"
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()


#| fig-cap: "Time series plot with modified ylim"
g +
    geom_line() +
    ylim(-3, 3)


#| fig-cap: "Time series plot with restricted y-axis range"
g +
    geom_line() +
    coord_cartesian(ylim = c(-3, 3))



cutpoints <- quantile(maacs$logno2_new, seq(0, 1, length = 4), na.rm = TRUE)



maacs$no2tert <- cut(maacs$logno2_new, cutpoints)



## See the levels of the newly created factor variable
levels(maacs$no2tert)



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



options(width = 120)
sessioninfo::session_info()


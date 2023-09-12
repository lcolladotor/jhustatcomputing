#| fig-width: 5
#| fig-height: 5
#| fig-cap: "Scatterplot with loess curve"
data(airquality)
with(airquality, {
    plot(Temp, Ozone)
    lines(loess.smooth(Temp, Ozone))
})


#| fig-width: 5
#| fig-height: 5
#| fig-cap: "Scatterplot with loess curve"
data(airquality)
with(airquality, {
    plot(Temp, Ozone, main = "my plot")
    lines(loess.smooth(Temp, Ozone))
})


#| fig-width: 5
#| fig-height: 5
#| fig-cap: "Base plot with title"
data(cars)

## Create the plot / draw canvas
with(cars, plot(speed, dist))

## Add annotation
title("Speed vs. Stopping distance")



library(lattice)


#| fig-width: 8
#| fig-height: 4
#| fig-cap: "Lattice plot"
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))


#| eval: false
## install.packages("ggplot2")



library(ggplot2)


#| message: false
#| fig-width: 6
#| fig-height: 5
#| fig-cap: "ggplot2 plot"
library(tidyverse)
data(mpg)
mpg %>%
    ggplot(aes(displ, hwy)) +
    geom_point()



options(width = 120)
sessioninfo::session_info()


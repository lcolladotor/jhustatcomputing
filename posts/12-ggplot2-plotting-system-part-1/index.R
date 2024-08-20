## ------------------------------------------------------------------------------------------------------------------------
#| fig-width: 5
#| fig-height: 5
#| fig-cap: "Scatterplot of Temperature and Ozone in New York (base graphics)"
with(airquality, {
    plot(Temp, Ozone)
    lines(loess.smooth(Temp, Ozone))
})


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
#| warning: false
#| fig-cap: "Scatterplot of Temperature and Ozone in New York (ggplot2)"
library(tidyverse)
airquality %>%
    ggplot(aes(Temp, Ozone)) +
    geom_point() +
    geom_smooth(
        method = "loess",
        se = FALSE
    ) +
    theme_minimal()


## ------------------------------------------------------------------------------------------------------------------------
#| message: false
library(tidyverse) # this loads the ggplot2 R package
# library(ggplot2) # an alternative way to just load the ggplot2 R package
glimpse(mpg)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Plot of engine displacement and highway mileage using the mtcars dataset"
qplot(x = displ, y = hwy, data = mpg)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Engine displacement and highway mileage by drive class"
qplot(displ, hwy, data = mpg, color = drv)


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## qplot(displ, hwy, data = mpg, color = drv)


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## qplot(x = displ, y = hwy, data = mpg, color = drv)


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## qplot(hwy, displ, data = mpg, color = drv)


## ----eval=FALSE----------------------------------------------------------------------------------------------------------
## qplot(y = hwy, x = displ, data = mpg, color = drv)


## ------------------------------------------------------------------------------------------------------------------------
#| echo: false
#| fig-cap: "Palmer penguins"
#| out-width: '60%'
#| fig-align: 'center'
knitr::include_graphics("https://allisonhorst.github.io/palmerpenguins/reference/figures/lter_penguins.png")


## ------------------------------------------------------------------------------------------------------------------------
library(palmerpenguins)


## ------------------------------------------------------------------------------------------------------------------------
glimpse(penguins)


## ------------------------------------------------------------------------------------------------------------------------
penguins %>%
    count(species)


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Engine displacement and highway mileage w/smoother"
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Engine displacement and highway mileage w/smoother"
qplot(displ, hwy, data = mpg, geom = c("smooth"))


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Histogram of highway mileage by drive class"
qplot(hwy, data = mpg, fill = drv, binwidth = 2)


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself


## ------------------------------------------------------------------------------------------------------------------------
#| fig-cap: "Boxplots of highway mileage by drive class"
qplot(drv, hwy, data = mpg, geom = "boxplot")


## ------------------------------------------------------------------------------------------------------------------------
#| fig-width: 5
#| fig-cap: "Histogram of highway mileage by drive class"
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-width: 6
#| fig-cap: "Engine displacement and highway mileage by drive class"
qplot(displ, hwy, data = mpg, facets = . ~ drv)


## ------------------------------------------------------------------------------------------------------------------------
#| fig-width: 6
#| fig-cap: "Engine displacement and highway mileage by drive class w/smoother"
#| message: false
qplot(displ, hwy, data = mpg, facets = . ~ drv) +
    geom_smooth(method = "lm")


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself


## ------------------------------------------------------------------------------------------------------------------------
# try it yourself


## ----echo=TRUE-----------------------------------------------------------------------------------------------------------
library(here)
maacs <- read_csv(here("data", "maacs_sim.csv"), col_types = "icnn")
maacs


## ----fig.cap="Histogram of log eNO"--------------------------------------------------------------------------------------
qplot(log(eno), data = maacs)


## ----fig.cap="Histogram of log eNO by mouse allergic status"-------------------------------------------------------------
qplot(log(eno), data = maacs, fill = mopos)


## ----fig.cap="Density smooth of log eNO"---------------------------------------------------------------------------------
qplot(log(eno), data = maacs, geom = "density")


## ----fig.cap="Density smooth of log eNO by mouse allergic status"--------------------------------------------------------
qplot(log(eno), data = maacs, geom = "density", color = mopos)


## ----fig.cap="eNO and PM2.5"---------------------------------------------------------------------------------------------
qplot(log(pm25), log(eno), data = maacs, geom = c("point", "smooth"))


## ----fig.cap="eNO and PM2.5 by mouse allergic status"--------------------------------------------------------------------
qplot(log(pm25), log(eno), data = maacs, shape = mopos)


## ----fig.cap="eNO and PM2.5 by mouse allergic status"--------------------------------------------------------------------
qplot(log(pm25), log(eno), data = maacs, color = mopos)


## ------------------------------------------------------------------------------------------------------------------------
qplot(log(pm25), log(eno), data = maacs, color = mopos) +
    geom_smooth(method = "lm")


## ----fig.width=9---------------------------------------------------------------------------------------------------------
qplot(log(pm25), log(eno), data = maacs, facets = . ~ mopos) +
    geom_smooth(method = "lm")


## ------------------------------------------------------------------------------------------------------------------------
qplot(x = displ, y = hwy, data = mpg, color = "blue")


## ------------------------------------------------------------------------------------------------------------------------
options(width = 120)
sessioninfo::session_info()


#| message: false
#| echo: false
library(tidyverse)


#| fig-align: center
#| echo: false
#| fig-cap-location: "top"
#| fig-width: 4
knitr::include_graphics("http://upload.wikimedia.org/wikipedia/en/e/e9/John_Tukey.jpg")


#| warning: false
d <- airquality %>%
    mutate(Summer = ifelse(Month %in% c(7, 8, 9), 2, 3))
with(d, {
    plot(Temp, Ozone, col = unclass(Summer), pch = 19, frame.plot = FALSE)
    legend("topleft",
        col = 2:3, pch = 19, bty = "n",
        legend = c("Summer", "Non-Summer")
    )
})


#| warning: false
airquality %>%
    mutate(Summer = ifelse(Month %in% c(7, 8, 9),
        "Summer", "Non-Summer"
    )) %>%
    ggplot(aes(Temp, Ozone)) +
    geom_point(aes(color = Summer), size = 2) +
    theme_minimal()



browsers <- c(
    Chrome = 60, Safari = 14, UCBrowser = 7,
    Firefox = 5, Opera = 3, IE = 3, Noinfo = 8
)
browsers.df <- gather(
    data.frame(t(browsers)),
    "browser", "proportion"
)



pie(browsers, main = "Browser Usage (July 2022)")


#| eval: false
## ?pie



p <- browsers.df %>%
    ggplot(aes(
        x = reorder(browser, -proportion),
        y = proportion
    )) +
    geom_bar(stat = "identity")
p


#| eval: false
## ?ggplot2::theme



p <- p + xlab("Browser") +
    ylab("Proportion of Users")
p



p + ggtitle("Browser Usage (July 2022)")



p + ggtitle("Browser Usage (July 2022)") +
    theme(plot.title = element_text(hjust = 0.5))



p <- p + ggtitle("Browser Usage (July 2022)") +
    theme(
        plot.title = element_text(hjust = 0.5),
        text = element_text(size = 15)
    )
p



p + theme_bw()



p + theme_dark()



p + theme_classic() # axis lines!



p + ggthemes::theme_base()



set.seed(1000)
dat <- data.frame(
    "Treatment" = rnorm(10, 30, sd = 4),
    "Control" = rnorm(10, 36, sd = 4)
)
gather(dat, "type", "response") %>%
    ggplot(aes(type, response)) +
    geom_boxplot() +
    geom_point(position = "jitter") +
    ggtitle("Response to drug treatment")



set.seed(1000)
dat <- data.frame(
    "Treatment" = rgamma(10, 10, 1),
    "Control" = rgamma(10, 1, .01)
)
gather(dat, "type", "response") %>%
    ggplot(aes(type, response)) +
    geom_boxplot() +
    geom_point(position = "jitter")



gather(dat, "type", "response") %>%
    ggplot(aes(type, response)) +
    geom_boxplot() +
    geom_point(position = "jitter") +
    scale_y_log10()



set.seed(1000)
before <- runif(6, 5, 8)
after <- rnorm(6, before * 1.15, 2)
li <- range(c(before, after))
ymx <- max(abs(after - before))

par(mfrow = c(1, 2))
plot(before, after,
    xlab = "Before", ylab = "After",
    ylim = li, xlim = li
)
abline(0, 1, lty = 2, col = 1)

plot(before, after - before,
    xlab = "Before", ylim = c(-ymx, ymx),
    ylab = "Change (After - Before)", lwd = 2
)
abline(h = 0, lty = 2, col = 1)



z <- rep(c(0, 1), rep(6, 2))
par(mfrow = c(1, 2))
plot(z, c(before, after),
    xaxt = "n", ylab = "Response",
    xlab = "", xlim = c(-0.5, 1.5)
)
axis(side = 1, at = c(0, 1), c("Before", "After"))
segments(rep(0, 6), before, rep(1, 6), after, col = 1)

boxplot(before, after, names = c("Before", "After"), ylab = "Response")



x <- read_csv("https://github.com/kbroman/Talk_Graphs/raw/master/R/fig8dat.csv") %>%
    as_tibble(.name_repair = make.names)

p <- x %>%
    gather("drug", "proportion", -log.dose) %>%
    ggplot(aes(
        x = log.dose, y = proportion,
        color = drug
    )) +
    geom_line()
p



p + ggtitle("Survival proportion") +
    theme(
        plot.title = element_text(hjust = 0.5),
        text = element_text(size = 15)
    )



p + ggtitle("Survival proportion") +
    theme(
        plot.title = element_text(hjust = 0.5),
        text = element_text(size = 15),
        legend.position = c(0.2, 0.3)
    )



transparent_legend <- theme(
    legend.background = element_rect(fill = "transparent"),
    legend.key = element_rect(
        fill = "transparent",
        color = "transparent"
    )
)

p + ggtitle("Survival proportion") +
    theme(
        plot.title = element_text(hjust = 0.5),
        text = element_text(size = 15),
        legend.position = c(0.2, 0.3)
    ) +
    transparent_legend



heights <- cbind(
    rnorm(8, 73, 3), rnorm(8, 73, 3), rnorm(8, 80, 3),
    rnorm(8, 78, 3), rnorm(8, 78, 3)
)
colnames(heights) <- c("SG", "PG", "C", "PF", "SF")
rownames(heights) <- paste("team", 1:8)
heights



round(heights, 1)



transparent_legend <- theme(
    legend.background = element_rect(fill = "transparent"),
    legend.key = element_rect(
        fill = "transparent",
        color = "transparent"
    )
)

p + ggtitle("Survival proportion") +
    theme(
        plot.title = element_text(hjust = 0.5),
        text = element_text(size = 15),
        legend.position = c(0.2, 0.3)
    ) +
    xlab("dose (mg)") +
    transparent_legend



options(width = 120)
sessioninfo::session_info()


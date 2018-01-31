#' ---
#' title: "An overview of Data Visualization in R"
#' author: "Pavan Gurazada"
#' date: "January 2018"
#' output: html_document
#' ---


library(tidyverse)

set.seed(20130810)
theme_set(theme_bw())

dev.new()

data("diamonds")
glimpse(diamonds)

dsmall <- diamonds %>% sample_n(size = 100)
glimpse(dsmall)

# What is data, in the context of a plot?
# Aesthetic attributes (e.g., color, size and shape) of observations are visual 
# properties that affect the way observations are displayed. Each aesthetic is
# controlled by a scale

# This script is a birds eye view of plot types possible with ggplot2
# Not to be taken seriously

##################################
# Practical plotting using qplot #
##################################

attach(diamonds)
qplot(carat, price)
qplot(log(carat), log(price))
qplot(carat, x * y * z)
detach(diamonds)

attach(dsmall)
qplot(carat, price, color = color)
qplot(carat, price, shape = cut)
detach(dsmall)

attach(diamonds)
qplot(carat, price, alpha = I(1/10))
qplot(carat, price, alpha = I(1/100))
qplot(carat, price, alpha = I(1/200))
detach(diamonds)

# Adding smoothers to the plots

qplot(carat, price, data = dsmall, geom = c("point", "smooth"))
qplot(carat, price, data = diamonds, geom = c("point", "smooth"))

# Jitters and boxplots

qplot(color, price/carat, data = diamonds, geom = "jitter")
qplot(color, price/carat, data = diamonds, geom = "boxplot")
qplot(color, price/carat, data = diamonds, geom = "jitter", alpha = I(1/100))

# Histograms and densities

qplot(carat, data = diamonds, geom = "histogram")
qplot(carat, data = diamonds, geom = "density")
qplot(color, data = diamonds, geom = "bar")

# Compare distributions of subgroups
qplot(carat, data = diamonds, geom = "density", colour = color)
qplot(carat, data = diamonds, geom = "histogram", fill = color)
qplot(color, data = diamonds, geom = "bar", weight = carat) +
  scale_y_continuous("carat")

# Line plots
# Think what the geometry "line" means?

qplot(date, unemploy/pop, data = economics, geom = "line")
qplot(date, uempmed, data = economics, geom = "line")

# Faceting, employs formulas row_var ~ col_var, say what?

qplot(carat, data = diamonds, facets = color ~ ., 
      geom = "histogram", binwidth = 0.1)
qplot(carat, ..density.., data = diamonds, facets = color ~ ., 
      geom = "histogram", binwidth = 0.1)

# Axis labels, etc
qplot(carat, price/carat, data = dsmall,
      ylab = expression(frac(price, carat)),
      xlab = "Weight (carats)",
      main = "Small diamonds",
      xlim = c(0.2, 1))

qplot(carat, price, data = dsmall, log = "xy")

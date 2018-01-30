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

##################################
# Practical plotting using qplot##
##################################

# What is overplotting? How to display using transparency? Why is this not an 
# aesthetic?
# Plots like the following tell us where most of the data lies

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

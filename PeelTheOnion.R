library(tidyverse)

set.seed(20130810)
theme_set(theme_bw())

# Each layer of a plot has a life of its own. In fact, each layer may even come 
# from a different data set! 

# The components of a layer are: data(frame), aesthetic mappings, the geometry,
# the statistic that is applied to the data, and position adjustments to avoid
# overplotting.

ggplot(diamonds, aes(x = carat, y = price, color = cut))

# This returns a plot object mapping the data to aesthetics. However, the geometry
# is not specified, so there is nothing to see

# A strict specification following the grammer would force the addition of layers,
# like so:

ggplot(diamonds, aes(x = carat)) +
  layer(geom = "bar",
        position = "identity",
        stat = "bin",
        params = list(fill = "steelblue",
                      binwidth = 2))

# To avoid such cumbersome code, several shortcut helper functions exist that 
# aid to add the shortlist of often used geometries

# It is worthwhile to pause and ponder how each of the layer components are built 
# up here

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 2, fill = "steelblue")

ggplot(msleep, aes(x = sleep_rem/sleep_total, y = awake)) +
  geom_point() + 
  geom_smooth()

# Layers are R objects and hence can be used wiht different datasets without
# duplication

bestFit <- geom_smooth(method = "lm", 
                       se = FALSE, 
                       color = alpha("steelblue", 0.5),
                       size = 2)
qplot(sleep_rem, sleep_total, data = msleep) + bestFit
qplot(awake, brainwt, data = msleep, log = "y") + bestFit
qplot(bodywt, brainwt, data = msleep, log = "xy") + bestFit

# The default aesthetic mapping in the plot can be overwritten or extended by 
# further layers. Use layers with care to reflect what you want to express

ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point(aes(color = factor(cyl)))

ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point(aes(color = factor(cyl))) +
  geom_point(aes(y = disp))

# We can map an aesthetic to a variable or set it to be a constant. Note the 
# difference

ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point(aes(color = factor(cyl)))

ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point(color = "darkblue")

ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point(aes(color = "darkblue"))


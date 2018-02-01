#' ---
#' title: "Laying multiple plots on a page "
#' author: Pavan Gurazada
#' date: "`r format(sys.Date())`"
#' output: github_document
#' ---
#' 

#' Beyond faceting, where there is significant commonality between the plots on
#' the grid, sometimes, one needs to combine multiple plots on to a page
#' (primarily when publishing). This is out of bounds for the base graphics
#' system provided by ggplot2. However, it is as easily achieved by using
#' suppplementrary packages that build on ggplot2.
#' 
#' I have used `gridExtra` to good effect in such situations 

library(tidyverse)
library(gridExtra)

a <- ggplot(economics, aes(x = date, y = unemploy)) +
      geom_line()

b <- ggplot(economics, aes(x = uempmed, y = unemploy)) +
      geom_point() +
      geom_smooth(se = FALSE)

c <- ggplot(economics, aes(x = uempmed, y = unemploy)) +
      geom_path()

gridExtra::grid.arrange(a, b, c)
gridExtra::grid.arrange(a, b, c, nrow = 2)
gridExtra::grid.arrange(a, b, c, ncol = 1)

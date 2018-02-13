An overview of layer options for ggplot2
================
Pavan Gurazada
2018-01-31

``` r
library(tidyverse)
```

Build the plot in layers; think of each layer carefully and what purpose it serves Is it to display the data (and let the viewer build conclusions), present statistical summaries, or add meta data? **1. OVERVIEW OF PLOT TYPES**

``` r
df <- data.frame(x = c(3, 1, 5),
                 y = c(2, 4, 6), 
                 label = letters[1:3])

p <- ggplot(df, aes(x, y, label = label)) +
      xlab(NULL) +
      ylab(NULL)

p + geom_point() + labs(title = "geom_point")
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-2-1.png)

``` r
p + geom_bar(stat="identity") + labs(title = "geom_bar")
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-2-2.png)

``` r
p + geom_line() + labs(title = "geom_line")
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-2-3.png)

``` r
p + geom_path() + labs(title = "geom_path")
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-2-4.png)

``` r
p + geom_area() + labs(title = "geom_area")
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-2-5.png)

``` r
p + geom_text() + labs(title = "geom_text")
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-2-6.png)

``` r
p + geom_tile() + labs(title = "geom_tile")
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-2-7.png)

**2. DISPLAYING DISTRIBUTIONS**

Use histograms for 1d distributions. In my experience, density plots are a bit misleading

*What is the distribution of depth of diamonds?*

``` r
p <- ggplot(diamonds, aes(x = depth))

p + geom_histogram(aes(y = ..density..), binwidth = 0.1) +
    facet_grid(cut ~ .)
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
ggplot(mpg, aes(x = class, y = cty)) +
  geom_jitter()
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-3-2.png)

``` r
ggplot(mpg, aes(x = class, y = drv)) +
  geom_jitter()
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-3-3.png)

**3. OVERPLOTTING**

Too many data points overlaid on one another obscuring the actual data density

``` r
df <- data.frame(x = rnorm(2000),
                 y = rnorm(2000))
```

One way to tackle it is to reduce the size of the geom point

``` r
p <- ggplot(df, aes(x, y))
p + geom_point()
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
p + geom_point(shape = 1)
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-5-2.png)

``` r
p + geom_point(shape = ".")
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-5-3.png)

Another way is to control the transparency of the points. This is my preferred option

``` r
p + geom_point(color = alpha("black", 1/3))
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-6-1.png)

``` r
p + geom_point(color = alpha("black", 1/5))
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-6-2.png)

``` r
p + geom_point(color = alpha("black", 1/20))
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-6-3.png)

Discrete data can be handled with jitter

**4. DESCRIBING ESTIMATE UNCERTAINTY**

Specific geoms tackle intervals to describe uncertainty

Unfinished due to lack of good data to showcase, but geom\_errorbar is extremely useful to highlight uncertainty **5. ANNOTATION**

``` r
p <- ggplot(economics, aes(x = date, y = unemploy)) +
      geom_line() +
      xlab("") +
      ylab("No. unemployed (1000s)")
```

We can annotate specific regions in a plot to highlight patterns

These regions can be composed from other data sets too!

``` r
p + geom_vline(aes(xintercept = start), data = presidential)
```

![](PlotTools_files/figure-markdown_github/unnamed-chunk-8-1.png)

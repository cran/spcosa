## ---- echo=FALSE--------------------------------------------------------------
knitr::opts_chunk$set(comment = NA)

## -----------------------------------------------------------------------------
library(spcosa)

## -----------------------------------------------------------------------------
library(ggplot2)

## -----------------------------------------------------------------------------
set.seed(314)

## ---- message=FALSE-----------------------------------------------------------
library(sp)
grd <- expand.grid(s1 = 1:100, s2 = 1:50)
gridded(grd) <- ~ s1 * s2

## -----------------------------------------------------------------------------
stratification <- stratify(grd, nStrata = 75, nTry = 10)

## ---- fig.width=7, fig.height=4, out.width=500--------------------------------
plot(stratification)

## ---- fig.width=7, fig.height=4, out.width=500, message=FALSE-----------------
plot(stratification) +
    scale_x_continuous(name = "Easting (km)") +
    scale_y_continuous(name = "Northing (km)")

## -----------------------------------------------------------------------------
sampling_pattern <- spsample(stratification)

## ---- fig.width=7, fig.height=4, out.width=500--------------------------------
plot(sampling_pattern)

## ---- fig.width=7, fig.height=4, out.width=500--------------------------------
plot(stratification, sampling_pattern)

## -----------------------------------------------------------------------------
sampling_points <- as(sampling_pattern, "data.frame")
head(sampling_points)

## ---- echo=FALSE--------------------------------------------------------------
prior_points <- spsample(grd, n = 50, type = "random")
prior_points <- as(prior_points, "data.frame")
names(prior_points) <- c("s1", "s2")

## -----------------------------------------------------------------------------
head(prior_points)

## -----------------------------------------------------------------------------
coordinates(prior_points) <- ~ s1 * s2
stratification <- stratify(grd, priorPoints = prior_points, nStrata = 75, nTry = 100)
sampling_pattern <- spsample(stratification)

## ---- fig.width=7, fig.height=4, out.width=500--------------------------------
plot(stratification, sampling_pattern)

## -----------------------------------------------------------------------------
stratification <- stratify(grd, nStrata = 25, nTry = 10)

## ---- fig.width=7, fig.height=4, out.width=500--------------------------------
plot(stratification)

## -----------------------------------------------------------------------------
sampling_pattern <- spsample(stratification, n = 2)

## ---- fig.width=7, fig.height=4, out.width=500--------------------------------
plot(stratification, sampling_pattern)

## -----------------------------------------------------------------------------
sampling_points <- as(sampling_pattern, "data.frame")
head(sampling_points)

## -----------------------------------------------------------------------------
my_data <- data.frame(clay = rbeta(50, 2, 25), SOM = rbeta(50, 1, 50))
head(my_data)

## -----------------------------------------------------------------------------
estimate("spatial mean", stratification, sampling_pattern, my_data)

## -----------------------------------------------------------------------------
estimate("standard error", stratification, sampling_pattern, my_data)

## -----------------------------------------------------------------------------
scdf <- estimate("scdf", stratification, sampling_pattern, my_data)

## -----------------------------------------------------------------------------
head(scdf$clay)
head(scdf$SOM)

## ---- fig.width=6, fig.height=5, out.width=400, echo=FALSE--------------------
tmp <- as.data.frame(scdf$clay)
tmp$value <- tmp$value * 0.01
dx <- mean(diff(tmp$value))
dat <- data.frame(
    x = c(tmp$value[1] - dx, tmp$value),
    xend = c(tmp$value, tmp$value[nrow(tmp)]+ dx),
    yend =  c(tmp$cumFreq, 1)
)
ggplot() +
    geom_segment(data = dat, mapping = aes(x = x, y = yend, xend = xend, yend = yend)) +
    geom_point(data = dat[-1, ], mapping = aes(x = x, y = yend), shape = 16) +
        scale_x_continuous(name = "x : clay content (g/dag)") +
        scale_y_continuous(name = "cumulative frequency")
tmp <-  unique(as.data.frame(scdf$SOM))
tmp$value <- tmp$value * 0.01
dx <- mean(diff(tmp$value))
dat <- data.frame(
    x = c(tmp$value[1] - dx, tmp$value),
    xend = c(tmp$value, tmp$value[nrow(tmp)]+ dx),
    yend =  c(tmp$cumFreq, 1)
)
ggplot() +
    geom_segment(data = dat, mapping = aes(x = x, y = yend, xend = xend, yend = yend)) +
    geom_point(data = dat[-1, ], mapping = aes(x = x, y = yend), shape = 16) +
    scale_x_continuous(name = "x : soil organic matter content (g/dag)") +
    scale_y_continuous(name = "cumulative frequency")

## -----------------------------------------------------------------------------
library(rgdal)
directory <- system.file("maps", package = "spcosa")
shp_farmsum <- readOGR(dsn = directory, layer = "farmsum", verbose = FALSE)


## ---- fig.width=6, fig.height=6, out.width=400--------------------------------
stratification <- stratify(shp_farmsum, nStrata = 20, equalArea = TRUE, nTry = 10)
plot(stratification)

## ---- fig.width=6, fig.height=6, out.width=400--------------------------------
sampling_pattern <- spsample(stratification, n = 2, type = "composite")
plot(stratification, sampling_pattern)

## -----------------------------------------------------------------------------
sampling_points <- as(sampling_pattern, "data.frame")
head(sampling_points)

## ---- echo=FALSE--------------------------------------------------------------
my_data <- data.frame(
  clay = c(9.7, 10.4),
  SOM = c(4.9, 5.2)
)

## -----------------------------------------------------------------------------
estimate("spatial mean", stratification, sampling_pattern, my_data)
estimate("standard error", stratification, sampling_pattern, my_data)

## -----------------------------------------------------------------------------
sampling_pattern <- spsample(stratification, n = 2)
sampling_points <- as(sampling_pattern, "data.frame")
head(sampling_points)

## ---- fig.width=6, fig.height=6, out.width=400--------------------------------
plot(stratification, sampling_pattern)

## -----------------------------------------------------------------------------
grd <- expand.grid(
    longitude = seq(from = -176, to = 180, by = 4),
    latitude  = seq(from =  -86, to =  86, by = 4)
)
gridded(grd) <-  ~ longitude * latitude

grd_crs <- grd
proj4string(grd_crs) <- CRS("EPSG:4326")


## -----------------------------------------------------------------------------
strata     <- stratify(grd,     nStrata = 50)
strata_crs <- stratify(grd_crs, nStrata = 50)

## ---- fig.width=8, fig.height=5, out.width=500--------------------------------
plot(strata)
plot(strata_crs)

## -----------------------------------------------------------------------------
shp_mijdrecht <- readOGR(
    dsn = system.file("maps", package = "spcosa"), 
    layer = "mijdrecht", verbose = FALSE)
stratification <- stratify(shp_mijdrecht, nStrata = 1, nGridCells = 5000)
sampling_pattern <- spsample(stratification, n = 30)

## ---- fig.width=5, fig.height=7, out.width=300--------------------------------
plot(stratification, sampling_pattern)

## -----------------------------------------------------------------------------
doughnut <- expand.grid(s1 = -25:25, s2 = -25:25)
d <- with(doughnut, sqrt(s1^2 + s2^2))
doughnut <- doughnut[(d < 25) & (d > 15), ]
coordinates(doughnut) <- ~ s1 * s2
gridded(doughnut) <- TRUE

## ---- fig.width=5, fig.height=5, out.width=350--------------------------------
stratification <- stratify(doughnut, nStrata = 2, nTry = 100)
sampling_pattern <- spsample(stratification)
plot(stratification, sampling_pattern)

## ---- echo=FALSE--------------------------------------------------------------
sessionInfo()


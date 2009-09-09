# example spcosa package: spatial coverage sampling

# load gstat package for model-based inference
library(gstat)

# initialize pseudo random number generator
set.seed(700124)

# read vector representation of the "Farmsum" field
shpFarmsum <- readOGR(dsn = system.file("maps", package = "spcosa"), layer = "farmsum")

# stratify Farmsum into 50 strata
myStratification <- stratify(shpFarmsum, nStrata = 50)

# plot stratification
plot(myStratification)

# select centroid of each stratum
mySamplingPattern <- spsample(myStratification)

# plot sampling pattern
plot(myStratification, mySamplingPattern)

# extract sampling points
spData <- as(mySamplingPattern, "data.frame")

# simulate data
# (obviously, in real-world applications these data have to be
# obtained by field work)
spData$observation <- rnorm(n = nrow(spData), mean = 10, sd = 1)

# cast spData to class "SpatialPointsDataFrame"
coordinates(spData) <- ~ x1 * x2

# predict the global mean "observation" for the "Farmsum"-field
# by ordinary block kriging (see ?gstat::predict.gstat for details)
g <- gstat(
    id = "observation",
    formula = observation ~ 1,
    data = spData,
    model = vgm(psill = 1.0, model = "Nug")
)
yhat <- predict(g, newdata = shpFarmsum, block = block)
as(yhat, "data.frame")

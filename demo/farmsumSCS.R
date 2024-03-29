# example spcosa package: spatial coverage sampling

# check if required packages are available
if (suppressWarnings(!require(sf))) {
    stop("This demo requires package 'sf'.\nThis package is currently not available. Please install 'sf' first.", call. = FALSE)
}    

# initialize pseudo random number generator
set.seed(700124)

# read vector representation of the "Farmsum" field
shpFarmsum <- as(st_read(
    dsn = system.file("maps", package = "spcosa"),
    layer = "farmsum"), "Spatial")

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
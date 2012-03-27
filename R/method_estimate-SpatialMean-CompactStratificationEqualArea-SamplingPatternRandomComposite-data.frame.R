setMethod(
    f = "estimate",
    signature = signature(
        statistic = "SpatialMean",
        stratification = "CompactStratificationEqualArea",
        samplingPattern = "SamplingPatternRandomComposite",
        data = "data.frame"
    ),
    definition = function(statistic, stratification, samplingPattern, data, ...) {

        # check if data is available for each sampling location
        sampleSize <- getSampleSize(samplingPattern)
        if (nrow(data) != sampleSize) {
            stop("number of data should be equal to the number of composites,", call. = FALSE)
        }

        # estimate the spatial mean (eq. 7.4, De Gruijter et. al, 2006)
        colMeans(data)
    }
)

setMethod(
    f = "estimate",
    signature = signature(
        statistic = "SamplingVariance",
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

        # estimate the sampling variance (eq. 7.5, De Gruijter et. al, 2006)
        apply(X = data, MARGIN = 2, FUN = var) / sampleSize
    }
)

setMethod(
    f = "estimate",
    signature = signature(
        statistic = "SpatialCumulativeDistributionFunction",
        stratification = "CompactStratification",
        samplingPattern = "SamplingPatternRandomSamplingUnits",
        data = "data.frame"
    ),
    definition = function(statistic, stratification, samplingPattern, data, ...) {
        lapply(
            X = data,
            FUN = function(y) {
                ys <- sort(unique(y))
                cbind(
                    value = ys,
                    cumFreq = as.vector(
                        sapply(
                            X = ys,
                            FUN = function(threshold) {
                                estimate(
                                    statistic = new("SpatialMean"),
                                    stratification = stratification,
                                    samplingPattern = samplingPattern,
                                    data = data.frame(
                                        i = ifelse(y < threshold, 1, 0)
                                    )
                                )
                            }
                        )
                    )
                )
            }
        )
    }
)
